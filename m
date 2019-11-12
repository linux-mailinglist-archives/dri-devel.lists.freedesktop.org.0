Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F8F8BCE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 10:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364156EAAC;
	Tue, 12 Nov 2019 09:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6CE6EAAC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:30:31 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iUSVG-0007kW-2d; Tue, 12 Nov 2019 09:30:26 +0000
From: Colin King <colin.king@canonical.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH][next] backlight: qcom-wled: fix spelling mistake "trigged" ->
 "triggered"
Date: Tue, 12 Nov 2019 09:30:25 +0000
Message-Id: <20191112093025.98638-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIGRldl9lcnIgZXJyb3IgbWVzc2FnZS4gRml4IGl0LgoK
U2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
cWNvbS13bGVkLmMKaW5kZXggMzNiNjAwN2M1ZTU1Li5kNDYwNTJkOGZmNDEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCisrKyBiL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L3Fjb20td2xlZC5jCkBAIC0zMjIsNyArMzIyLDcgQEAgc3RhdGljIGlycXJldHVy
bl90IHdsZWRfc2hvcnRfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqX3dsZWQpCiAJCXdsZWQt
PnNob3J0X2NvdW50ID0gMTsKIAogCWlmICh3bGVkLT5zaG9ydF9jb3VudCA+IFdMRURfU0hPUlRf
Q05UX01BWCkgewotCQlkZXZfZXJyKHdsZWQtPmRldiwgIlNob3J0IHRyaWdnZWQgJWQgdGltZXMs
IGRpc2FibGluZyBXTEVEIGZvcmV2ZXIhXG4iLAorCQlkZXZfZXJyKHdsZWQtPmRldiwgIlNob3J0
IHRyaWdnZXJlZCAlZCB0aW1lcywgZGlzYWJsaW5nIFdMRUQgZm9yZXZlciFcbiIsCiAJCQl3bGVk
LT5zaG9ydF9jb3VudCk7CiAJCXdsZWQtPmRpc2FibGVkX2J5X3Nob3J0ID0gdHJ1ZTsKIAkJZ290
byB1bmxvY2tfbXV0ZXg7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
