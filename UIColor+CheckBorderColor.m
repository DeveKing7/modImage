//
//  UIColor+CheckBorderColor.m
//  CeckColor
//
//  Created by 美迅 on 16/9/21.
//  Copyright © 2016年 ShouQu. All rights reserved.
//

#import "UIColor+CheckBorderColor.h"

@implementation UIColor (CheckBorderColor)


+ (BOOL) checkBorderWhite:(UIImage*) image

{
    
    // 分配内存
    
    const int imageWidth = image.size.width;
    
    const int imageHeight = image.size.height;
    
    size_t bytesPerRow = imageWidth * 4;
    
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    
    
    // 创建context
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    
    
    // 遍历像素
    
    int pixelNum = imageWidth * imageHeight;
    
    uint32_t* pCurPtr = rgbImageBuf;
    
 
    BOOL colorBol = false;
    
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
        
    {
        if (i>imageWidth&&i<pixelNum-imageWidth) {
            continue;
        }
        //        //去除白色...将0xFFFFFF00换成其它颜色也可以替换其他颜色。
        
        //        if ((*pCurPtr & 0xFFFFFF00) >= 0xffffff00) {
        
        //
        
        //            uint8_t* ptr = (uint8_t*)pCurPtr;
        
        //            ptr[0] = 0;
        
        //        }
        
        //接近白色
        
        //将像素点转成子节数组来表示---第一个表示透明度即ARGB这种表示方式。ptr[0]:透明度,ptr[1]:R,ptr[2]:G,ptr[3]:B
        
        //分别取出RGB值后。进行判断需不需要设成透明。
        
        uint8_t* ptr = (uint8_t*)pCurPtr;
        
        if (ptr[1] > 240 && ptr[2] > 240 && ptr[3] > 240) {
            
            //当RGB值都大于240则比较接近白色的都将透明度设为0.-----即接近白色的都设置为透明。某些白色背景具有杂质就会去不干净，用这个方法可以去干净
            colorBol = YES;
            
            
        }else{
            
            colorBol = NO;
            
        }
        
        
        
    }
    
    
    return  colorBol;
    
//    // 将内存转成image
//    
//    CGDataProviderRef dataProvider =CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, nil);
//    
//    
//    
//    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight,8, 32, bytesPerRow, colorSpace,
//                                        
//                                        kCGImageAlphaLast |kCGBitmapByteOrder32Little, dataProvider,
//                                        
//                                        NULL, true,kCGRenderingIntentDefault);
//    
//    CGDataProviderRelease(dataProvider);
//    
//    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
//    
//    // 释放
//    
//    CGImageRelease(imageRef);
//    
//    CGContextRelease(context);
//    
//    CGColorSpaceRelease(colorSpace);
    
}

+ (UIImage *)getBorderWhite:(UIImage*) image

{
    
    NSMutableArray * arry = [[NSMutableArray alloc]init];
    
    // 分配内存
    
    const int imageWidth = image.size.width;
    
    const int imageHeight = image.size.height;
    
    size_t bytesPerRow = imageWidth * 4;
    
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    unsigned char *data = calloc(imageWidth * imageHeight * 4, sizeof(unsigned char)); // 取图片首地址
    
    
    // 创建context
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    
    
    // 遍历像素
    
    int pixelNum = imageWidth * imageHeight;
    
    uint32_t* pCurPtr = rgbImageBuf;
    
    
    
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
        
    {
//        if (i>imageWidth&&i<pixelNum-imageWidth) {
//            continue;
//        }
        //        //去除白色...将0xFFFFFF00换成其它颜色也可以替换其他颜色。
        
        //        if ((*pCurPtr & 0xFFFFFF00) >= 0xffffff00) {
        
        //
        
        //            uint8_t* ptr = (uint8_t*)pCurPtr;
        
        //            ptr[0] = 0;
        
        //        }
        
        //接近白色
        
        //将像素点转成子节数组来表示---第一个表示透明度即ARGB这种表示方式。ptr[0]:透明度,ptr[1]:R,ptr[2]:G,ptr[3]:B
        
        //分别取出RGB值后。进行判断需不需要设成透明。
        
        uint8_t* ptr = (uint8_t*)pCurPtr;
        
           NSLog(@"%d %d %d",ptr[1],ptr[2],ptr[3]);
        if ((ptr[1] < 55 && ptr[2] < 55 && ptr[3] < 55)||(ptr[1] < 70 && ptr[2] < 55 && ptr[3] < 55)) {
   
            
            
             uint8_t* ptr2 = ptr +10 ;
 
          ptr[3] = ptr2[3];
             ptr[2] =ptr2[2];
             ptr[1] = ptr2[1];
            
       
            
           // ptr[0]=0;
            //当RGB值都大于240则比较接近白色的都将透明度设为0.-----即接近白色的都设置为透明。某些白色背景具有杂质就会去不干净，用这个方法可以去干净
//            if (i>0) {
//                
//             uint8_t* ptr = (uint8_t*)pCurPtr-1;
//                  if (ptr[1] == 255 && ptr[2] == 255 && ptr[3] ==255) {
//                      
//                      CGFloat x = (int)i/imageWidth;
//                      CGFloat y = (int)i%imageWidth;
//                      
//                      CGPoint point = CGPointMake(x, y);
//                      
//                      NSValue * value = [NSValue valueWithCGPoint:point];
//                      
//                      [arry addObject:value];
//                      
//                      
//                  }
//                
//                
//                
//            }
//            
//            
//        }else{
//            
//    
//            
       }
        
        
        
    }
    
    
//    return  arry;
    
    //    // 将内存转成image
    //
        CGDataProviderRef dataProvider =CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, nil);
    
    
    
        CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight,8, 32, bytesPerRow, colorSpace,
    
                                            kCGImageAlphaLast |kCGBitmapByteOrder32Little, dataProvider,
    
                                            NULL, true,kCGRenderingIntentDefault);
    
        CGDataProviderRelease(dataProvider);
    
        UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
        // 释放
    
        CGImageRelease(imageRef);
    
        CGContextRelease(context);
        
        CGColorSpaceRelease(colorSpace);
    
    
    return resultUIImage;
    
}

+ (UIImage *)drawImage:(UIImage *)image
{
    CGImageRef cgimage = [image CGImage];
    
    size_t width = CGImageGetWidth(cgimage); // 图片宽度
    size_t height = CGImageGetHeight(cgimage); // 图片高度
    unsigned char *data = calloc(width * height * 4, sizeof(unsigned char)); // 取图片首地址
    size_t bitsPerComponent = 8; // r g b a 每个component bits数目
    size_t bytesPerRow = width * 4; // 一张图片每行字节数目 (每个像素点包含r g b a 四个字节)
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB(); // 创建rgb颜色空间
    
    CGContextRef context =
    CGBitmapContextCreate(data,
                          width,
                          height,
                          bitsPerComponent,
                          bytesPerRow,
                          space,
                          kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), cgimage);
    
    for (size_t i = 0; i < height; i++)
    {
        for (size_t j = 0; j < width; j++)
        {
            size_t pixelIndex = i * width * 4 + j * 4;
            
            unsigned char red = data[pixelIndex];
            unsigned char green = data[pixelIndex + 1];
            unsigned char blue = data[pixelIndex + 2];
            
            if ((red < 120 && green < 120 && blue < 120)||(red <55 && green < 55 && blue < 75)||(red <100 && green < 55 && blue < 50)) {
                
                
          
    
                    
              
                size_t pixelIndex2 = i * width * 4 + (j+35) * 4;
                
                    unsigned char red2 = data[pixelIndex2];
                    unsigned char green2 = data[pixelIndex2 + 1];
                    unsigned char blue2 = data[pixelIndex2 + 2];
                
              if ((red2 < 90 && green2 < 90 && blue2 < 90)||(red2 <55 && green2 < 55 && blue2 < 75)||(red2 <100 && green2 < 55 && blue2 < 50)) {
                  
                  size_t pixelIndex3 = i * width * 4 + (j+10) * 4;
                  
                  unsigned char red3 = data[pixelIndex3];
                  unsigned char green3 = data[pixelIndex3 + 1];
                  unsigned char blue3 = data[pixelIndex3 + 2];
                
                  // 修改颜色
                  
                  if ((red3 < 90 && green3 < 90 && blue3 < 90)||(red3 <55 && green3 < 55 && blue3 < 75)||(red3 <100 && green3 < 55 && blue3 < 50)) {

              
                        
                  
                      size_t pixelIndex4 = i * width * 4 + (j-10) * 4;
                      
                      unsigned char red4 = data[pixelIndex4];
                      unsigned char green4 = data[pixelIndex4 + 1];
                      unsigned char blue4 = data[pixelIndex4 + 2];
                      
                      
                      
                      data[pixelIndex] = red4;
                      data[pixelIndex+1] = green4;
                      data[pixelIndex+2] = blue4;
                   
                  }
                  else{
                  data[pixelIndex] = red3;
                  data[pixelIndex+1] = green3;
                  data[pixelIndex+2] = blue3;
                  }
                  
                }else
                {
                    // 修改颜色
               
                    data[pixelIndex] = red2;
                    data[pixelIndex+1] = green2;
                    data[pixelIndex+2] = blue2;
                }
              }
            
        
 
    }
    }
    cgimage = CGBitmapContextCreateImage(context);
    return  [UIImage imageWithCGImage:cgimage];
}

@end
