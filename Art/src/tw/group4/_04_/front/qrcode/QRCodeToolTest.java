package tw.group4._04_.front.qrcode;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.zxing.EncodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.WriterException;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import tw.group4._04_.front.qrcode.QRCodeTool;

public class QRCodeToolTest {
	public static void main(String[] args) throws WriterException, IOException, NotFoundException {
// 二維碼字串
		String qrCodeData = "https://www.google.com/";
// 二維碼名稱
		String filePath = "WebContent/WEB-INF/pages/images/04/QRcodeOutput/QRCode.png";
// 字元編碼
		String charset = "UTF-8"; // "ISO-8859-1"
		Map hintMap = new HashMap();
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		QRCodeTool.createQRCode(qrCodeData, filePath, charset, hintMap, 200, 200);
		System.out.println("二維碼影象建立成功!");

		System.out.println("讀取二維碼資料: " + QRCodeTool.readQRCode(filePath, charset, hintMap));
	}

}
