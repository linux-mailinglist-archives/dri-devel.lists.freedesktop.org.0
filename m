Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF9104D07
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076536EB79;
	Thu, 21 Nov 2019 08:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1294F6E610
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 17:10:38 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Frida LCD Co.,
 Ltd.
Date: Wed, 20 Nov 2019 18:10:25 +0100
Message-Id: <20191120171027.1102250-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574269834; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=/xS8wWdZbwsK04N14PWTSsZY6F81o/i8NADVFiFMWpY=;
 b=GgCoreU47Z1orXM9eQjTD5auYk05YUsF9vw01cpJ7dCo7QC7n+QMwhWCS0ZNIcvw1u5d++
 MpxFhVZNclAXgo9az569U5nY0Xb1VTd5jIC0SYSEuWMYuIoXhOm9ySo68XpDKawiKQR/wF
 TDoHsdlcfuWCAXmg01jUCpXIdBL3OTY=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIGVudHJ5IGZvciBTaGVuemhlbiBGcmlkYSBMQ0QgQ28uLCBMdGQuCgpTaWduZWQtb2Zm
LWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0tCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCmluZGV4IDk2N2U3OGM1ZWMw
YS4uOWM2ZTFiNDI0MzViIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCkBAIC0zMzcsNiArMzM3LDggQEAgcGF0dGVy
blByb3BlcnRpZXM6CiAgICAgZGVzY3JpcHRpb246IEZpcmVmbHkKICAgIl5mb2NhbHRlY2gsLioi
OgogICAgIGRlc2NyaXB0aW9uOiBGb2NhbFRlY2ggU3lzdGVtcyBDby4sTHRkCisgICJeZnJpZGEs
LioiOgorICAgIGRlc2NyaXB0aW9uOiBTaGVuemhlbiBGcmlkYSBMQ0QgQ28uLCBMdGQuCiAgICJe
ZnJpZW5kbHlhcm0sLioiOgogICAgIGRlc2NyaXB0aW9uOiBHdWFuZ3pob3UgRnJpZW5kbHlBUk0g
Q29tcHV0ZXIgVGVjaCBDby4sIEx0ZAogICAiXmZzbCwuKiI6Ci0tIAoyLjI0LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
