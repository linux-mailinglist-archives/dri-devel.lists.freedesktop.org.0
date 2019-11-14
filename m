Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547EFCBC8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 18:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203826E3AE;
	Thu, 14 Nov 2019 17:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277136E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 17:27:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iVItt-0003AZ-5S; Thu, 14 Nov 2019 17:27:21 +0000
From: Colin King <colin.king@canonical.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Sasha Levin <sashal@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH][next] video: hyperv: hyperv_fb: fix indentation issue
Date: Thu, 14 Nov 2019 17:27:20 +0000
Message-Id: <20191114172720.322023-1-colin.king@canonical.com>
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
IGEgYmxvY2sgb2Ygc3RhdGVtZW50cyB0aGF0IGFyZSBpbmRlbnRlZAp0b28gZGVlcGx5LCByZW1v
dmUgdGhlIGV4dHJhbmVvdXMgdGFicy4KClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxj
b2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZf
ZmIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYwppbmRleCA0Y2QyN2U1MTcyYTEuLjVmY2Y0YmRm
ODVhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYworKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jCkBAIC01ODIsOCArNTgyLDggQEAgc3RhdGlj
IGludCBzeW50aHZpZF9nZXRfc3VwcG9ydGVkX3Jlc29sdXRpb24oc3RydWN0IGh2X2RldmljZSAq
aGRldikKIAl0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZwYXItPndhaXQsIFZTUF9U
SU1FT1VUKTsKIAlpZiAoIXQpIHsKIAkJcHJfZXJyKCJUaW1lIG91dCBvbiB3YWl0aW5nIHJlc29s
dXRpb24gcmVzcG9uc2VcbiIpOwotCQkJcmV0ID0gLUVUSU1FRE9VVDsKLQkJCWdvdG8gb3V0Owor
CQlyZXQgPSAtRVRJTUVET1VUOworCQlnb3RvIG91dDsKIAl9CiAKIAlpZiAobXNnLT5yZXNvbHV0
aW9uX3Jlc3AucmVzb2x1dGlvbl9jb3VudCA9PSAwKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
