Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D947847FF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 10:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971F89CBC;
	Wed,  7 Aug 2019 08:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BF666E6A0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 08:47:13 +0000 (UTC)
X-UUID: 254ee1cb51ed4a78b0899c8d3c7cfa2e-20190807
X-UUID: 254ee1cb51ed4a78b0899c8d3c7cfa2e-20190807
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1940075125; Wed, 07 Aug 2019 16:46:53 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 7 Aug 2019 16:46:49 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 7 Aug 2019 16:46:48 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 1/3] dt-bindings: display: mediatek: update dsi supported
 chips
Date: Wed, 7 Aug 2019 16:46:43 +0800
Message-ID: <20190807084645.63738-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190807084645.63738-1-jitao.shi@mediatek.com>
References: <20190807084645.63738-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 22670FF7270DC485EDD85179ACBA4B96868D55C5AD40A0C2D3336C185162785B2000:8
X-MTK: N
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRzaSBmb3IK
TWVkaWF0ZWsgTVQ4MTgzIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNo
aUBtZWRpYXRlay5jb20+CkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgot
LS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNp
LnR4dCAgICAgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKaW5kZXggZmFk
ZjMyN2M3Y2RmLi5hMTlhNmNjMzc1ZWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHNpLnR4dApAQCAtNyw3ICs3LDcgQEAgY2hhbm5lbCBvdXRwdXQuCiAKIFJlcXVpcmVkIHByb3Bl
cnRpZXM6CiAtIGNvbXBhdGlibGU6ICJtZWRpYXRlayw8Y2hpcD4tZHNpIgotICB0aGUgc3VwcG9y
dGVkIGNoaXBzIGFyZSBtdDI3MDEgYW5kIG10ODE3My4KKyAgdGhlIHN1cHBvcnRlZCBjaGlwcyBh
cmUgbXQyNzAxLCBtdDgxNzMgYW5kIG10ODE4My4KIC0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJl
c3MgYW5kIGxlbmd0aCBvZiB0aGUgY29udHJvbGxlcidzIHJlZ2lzdGVycwogLSBpbnRlcnJ1cHRz
OiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jay4KIC0gY2xvY2tz
OiBkZXZpY2UgY2xvY2tzCkBAIC0yNiw3ICsyNiw3IEBAIFRoZSBNSVBJIFRYIGNvbmZpZ3VyYXRp
b24gbW9kdWxlIGNvbnRyb2xzIHRoZSBNSVBJIEQtUEhZLgogCiBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgogLSBjb21wYXRpYmxlOiAibWVkaWF0ZWssPGNoaXA+LW1pcGktdHgiCi0gIHRoZSBzdXBwb3J0
ZWQgY2hpcHMgYXJlIG10MjcwMSBhbmQgbXQ4MTczLgorICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFy
ZSBtdDI3MDEsIG10ODE3MyBhbmQgbXQ4MTgzLgogLSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVz
cyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXJzCiAtIGNsb2NrczogUExM
IHJlZmVyZW5jZSBjbG9jawogLSBjbG9jay1vdXRwdXQtbmFtZXM6IG5hbWUgb2YgdGhlIG91dHB1
dCBjbG9jayBsaW5lIHRvIHRoZSBEU0kgZW5jb2RlcgotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
