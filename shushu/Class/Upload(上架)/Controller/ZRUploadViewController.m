//
//  ZRUploadViewController.m
//  shushu
//
//  Created by Apple on 16/7/1.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRUploadViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "UIView+ZRExtension.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

#define SCANVIEW_EdgeTop 100.0
#define SCANVIEW_EdgeLeft 50.0
#define TINTCOLOR_ALPHA 0.2  //浅色透明度
#define DARKCOLOR_ALPHA 0.5  //深色透明度
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ZRUploadViewController ()<AVCaptureMetadataOutputObjectsDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)scanfBook:(id)sender;

//输入输出的中间桥梁
@property (nonatomic,strong) AVCaptureSession *session;
//此view用来放置扫描匡、取消按钮、说明label
@property (nonatomic,weak) UIView *AVCapView;
//上下移动的绿色线条
@property (nonatomic,weak) UIView *QrCodeline;
@property (nonatomic,weak) NSTimer *_timer;




@end

@implementation ZRUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"宝贝上架";
//    self.tabBarController.tabBar.hidden = YES;
    self.kind.dataSource = self;
    self.kind.delegate = self;
    self.kind.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//扫码获得书籍的信息
- (IBAction)scanfBook:(id)sender {
    //创建一个view用来放置扫描区域、说明取消label、取消按钮
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
    self.AVCapView = tempView;
    self.AVCapView.backgroundColor = [UIColor colorWithRed:54.f/255.0 green:53.f/255.0 blue:58.f/255.0 alpha:1];
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, VIEW_HEIGHT - 100, 50, 25)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 500, 290, 60)];
    label.numberOfLines = 0;
    label.text = @"小提示：将条形码或二维码对准上方区域中心即可";
    label.textColor = [UIColor grayColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(touchAVCaancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.AVCapView addSubview:label];
    [self.AVCapView addSubview:cancelBtn];
    [self.view addSubview:self.AVCapView];
    
    //画上边框
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft, 1)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.AVCapView addSubview:topView];
    
    //画左边框
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, 1, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft)];
    leftView.backgroundColor = [UIColor whiteColor];
    [self.AVCapView addSubview:leftView];
    
    //画右边框
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft + VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, 1, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft + 1)];
    rightView.backgroundColor = [UIColor whiteColor];
    [self.AVCapView addSubview:rightView];
    
    //画下边框
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop + VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft, 1)];
    downView.backgroundColor = [UIColor whiteColor];
    [self.AVCapView addSubview:downView];
    
    //画中间的基准线
    UIView *qView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft + 1, SCANVIEW_EdgeTop, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft - 1, 2)];
    self.QrCodeline = qView;
    self.QrCodeline.backgroundColor = [UIColor greenColor];
    [self.AVCapView addSubview:self.QrCodeline];
    
    //先让基准线运动一次，避免定时器的时差
    [UIView animateWithDuration:1.2 animations:^{
        self.QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft - 1, 2);
    }];
    [self performSelector:@selector(createTimer) withObject:nil afterDelay:0.4];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    //创建输出流
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    //设置代理，在主线程里面刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    AVCaptureSession *s = [[AVCaptureSession alloc] init];
    self.session = s;
    //高质量采集率
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    [self.session addInput:input];
    [self.session addOutput:output];
    
    //设置扫码支持的编码格式
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    layer.frame = CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop + 40, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft, 220);
    [self.AVCapView.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [self.session startRunning];
    
}

//点击取消按钮
- (void)touchAVCaancelBtn{
    //摄像停止
    [self.session stopRunning];
    //定时器也要停止
    [self stopTimer];
    //刚刚创建的view要移除
    [self.AVCapView removeFromSuperview];
}

- (void)createTimer{
    self._timer = [NSTimer scheduledTimerWithTimeInterval:1.1 target:self selector:@selector(moveUpAndDownLine) userInfo:nil repeats:YES];
}

//滚来滚去
- (void)moveUpAndDownLine{
    CGFloat YY = self.QrCodeline.y;
    if (YY != VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop) {
        [UIView animateWithDuration:1.2 animations:^{
            self.QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop , VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft - 1,2);

        }];
    }else{
        [UIView animateWithDuration:1.2 animations:^{
             self.QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, SCANVIEW_EdgeTop, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft - 1,2);
        }];
    }
}

//停止定时器
- (void)stopTimer{
    if ([self._timer isValid] == YES) {
        [self._timer invalidate];
        self._timer = nil;
    }
}


- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        
        //请求获得书籍的信息
        [self loadBookInfo:metadataObject.stringValue];
        
        [self.session stopRunning];
        [self stopTimer];
        [self.AVCapView removeFromSuperview];
    }
}

//请求获得书籍的信息
- (void)loadBookInfo:(NSString *)isbnStr{
    //1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //2.拼接参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"userId"] = @"3";
    param[@"ISBN"] = isbnStr;
    
    //3.发送一个get请求
    [mgr GET:@"http://www.91shushu.com/product/getAppImgUrl" parameters:param success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        //请求成功会来到这里
        //设置请求成功后返回的书籍图片
        [self.imgBook sd_setImageWithURL:[NSURL URLWithString:responseObject[@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        
        self.bookName.text = responseObject[@"title"];
        self.writerLbl.text = responseObject[@"author"];
        self.oriPrice.text = responseObject[@"price"];
        self.bookCount.text = [NSString stringWithFormat:@"%@",responseObject[@"bookCount"]];
        self.isbnLbl.text = isbnStr;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败会来到这里
    }];
    
}

#pragma mark - UIPickerView的数据源和代理的方法
//返回多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//返回多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}

//返回每一行的书的类别
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0,160, 30)];
    [label setTextAlignment:NSTextAlignmentCenter];
    if (row == 0) {
        label.text = @"教材";
    }else if(row == 1){
        label.text = @"外语及考试";
    }else if(row == 2){
        label.text = @"小说";
    }else if(row == 3){
        label.text = @"人文社科";
    }else{
        label.text = @"其它";
    }
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    UILabel *label = (UILabel *)[pickerView viewForRow:row forComponent:component];
    [self.kingB setTitle:label.text forState:UIControlStateNormal];
    self.kind.hidden = YES;
}






//选择书的类别
- (IBAction)bookKind:(id)sender {
    self.kind.hidden = NO;
}
//上传数据和文件
- (IBAction)upBook:(id)sender {
    //1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //2.拼接参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"ISBN"] = self.isbnLbl.text;
    param[@"bookPrice"] = self.nowPrice.text;
    param[@"userId"] = @"3";
    param[@"bookCount"] = self.bookCount.text;
    param[@"title"] = self.bookName.text;
    param[@"price"] = self.oriPrice.text;
    param[@"categoryName"] = self.kingB.titleLabel.text;
    
    //3.发送请求
    [mgr POST:@"http://www.91shushu.com/product/upProduct" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功来到这里
        NSLog(@"请求成功");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败来到这里
        NSLog(@"%@",error);
    }];
}

//点击按钮选择拍照
- (IBAction)chooseImage:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"手机相册", nil];
    //最好这样写，因为可能显示其他的控制器当前控制器的view就取消了，这时程序就会出错
    [sheet showInView:self.view.window];
}


#pragma mark - UIActionSheet的代理方法
//用户选择选取照片之后执行的方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //判断用户点击了哪个按钮
    //调用手机的照相机的控制器
    UIImagePickerController *pc = [[UIImagePickerController alloc] init];
    //设置手机相机控制器的代理
    pc.delegate = self;
    
    switch (buttonIndex) {
        case 0:{   //手机拍照
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                return;
            }
            //设置照片的来源是手机拍照
            pc.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
            
            break;
        case 1:{   //手机相册
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                return;
            }
            //设置照片的来源是手机相册
            pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
            
            break;
            
        default:
            break;
    }
    [self presentViewController:pc animated:YES completion:nil];
    
}

#pragma mark - UIImagePickerControllerDelegate的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.imgBook.image = info[UIImagePickerControllerOriginalImage];
}









@end
