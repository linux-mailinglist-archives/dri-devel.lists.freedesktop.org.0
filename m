Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DAA10F969
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784FC6E3F5;
	Tue,  3 Dec 2019 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A133A6E218
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 15:41:38 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Frida LCD
 Co., Ltd.
Date: Mon,  2 Dec 2019 16:41:21 +0100
Message-Id: <20191202154123.64139-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1575301295; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=opmmpLOcnRQMoL3meCkpQD25iFtikQvdlBCiDKKS/MY=;
 b=UqMTCIjfs1qWkxgO38KGlB350bsAhvMtLFgbZGKqH9zc2yszSKUuMhm3VGz+6NaUvboeBk
 xbosbDs3jX0AVCKF7cmGbS6+dwdJ5HZjfaEeOTRsC/fUPao/1tocvSaQDCpDmh7tgtx1mK
 jxQLQl+uecjeUJFGmpQBjdvwDYv/upc=
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

QWRkIGFuIGVudHJ5IGZvciBTaGVuemhlbiBGcmlkYSBMQ0QgQ28uLCBMdGQuCgp2MjogTm8gY2hh
bmdlCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4K
QWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBEb2N1bWVudGF0
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
