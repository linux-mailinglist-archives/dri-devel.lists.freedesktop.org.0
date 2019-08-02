Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5E7F58E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 12:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965626EDC0;
	Fri,  2 Aug 2019 10:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0C36EDC0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 10:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 9ED5EFB03;
 Fri,  2 Aug 2019 12:55:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ugkm27Dqmsp; Fri,  2 Aug 2019 12:55:18 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4DE9A47246; Fri,  2 Aug 2019 12:55:18 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: Drop unused imx-ipuv3-crtc.o build
Date: Fri,  2 Aug 2019 12:55:18 +0200
Message-Id: <e5484fa33bffec220fd0590b502a962da17c9c72.1564743270.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UKCmNvbW1pdCAzZDFkZjk2YWQ0NjggKCJkcm0vaW14OiBtZXJnZSBpbXgtZHJtLWNvcmUg
YW5kIGlwdXYzLWNydGMgaW4gb25lIG1vZHVsZSIpCgppbXgtaXB1djMtY3J0Yy5vIGlzIGJ1aWx0
IHZpYSBpbXhkcm0tb2Jqcy4gU28gdGhlcmUncyBubyBuZWVkIHRvIGtlZXAgYW4KZXh0cmEgZW50
cnkgd2l0aCBhIG5vbiBleGlzdGluZyBjb25maWcgdmFsdWUgKENPTkZJR19EUk1fSU1YX0lQVVYz
KS4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2lteC9NYWtlZmlsZSB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L01ha2VmaWxlIGIvZHJp
dmVycy9ncHUvZHJtL2lteC9NYWtlZmlsZQppbmRleCBhYjZjODNjYWNlYjcuLjIxY2RjYzJmYWFi
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9NYWtlZmlsZQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vaW14L01ha2VmaWxlCkBAIC04LDUgKzgsNCBAQCBvYmotJChDT05GSUdfRFJNX0lN
WF9QQVJBTExFTF9ESVNQTEFZKSArPSBwYXJhbGxlbC1kaXNwbGF5Lm8KIG9iai0kKENPTkZJR19E
Uk1fSU1YX1RWRSkgKz0gaW14LXR2ZS5vCiBvYmotJChDT05GSUdfRFJNX0lNWF9MREIpICs9IGlt
eC1sZGIubwogCi1vYmotJChDT05GSUdfRFJNX0lNWF9JUFVWMykJKz0gaW14LWlwdXYzLWNydGMu
bwogb2JqLSQoQ09ORklHX0RSTV9JTVhfSERNSSkgKz0gZHdfaGRtaS1pbXgubwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
