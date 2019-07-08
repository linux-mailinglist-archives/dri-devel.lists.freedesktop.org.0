Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268CA63152
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559C3897AC;
	Tue,  9 Jul 2019 07:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFEB89B99
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:29 +0000 (UTC)
X-UUID: 1bdbffe45f6944818a02e060875f2b90-20190709
X-UUID: 1bdbffe45f6944818a02e060875f2b90-20190709
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 352697944; Tue, 09 Jul 2019 06:34:27 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:24 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 05/33] dt-bindings: mediatek: add RDMA1 description for mt8183 display
Date: Tue, 9 Jul 2019 06:33:45 +0800
Message-ID: <1562625253-29254-6-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A3E801B80224415BBEE53E0C5FC8EF8D1E9A499CFEC767BAA224665C56CB6882000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHBh
dGNoIGFkZCBSRE1BMSBkZXNjcmlwdGlvbiBmb3IgbXQ4MTgzIGRpc3BsYXkKClNpZ25lZC1vZmYt
Ynk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRp
c3AudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0CmluZGV4IGFmZDNjOTAuLmJiOTI3NGEgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRpc3AudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0CkBAIC0zMCw2ICszMCw3IEBAIFJl
cXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgogCSJtZWRpYXRlayw8Y2hp
cD4tZGlzcC1vdmwiICAgCQktIG92ZXJsYXkgKDQgbGF5ZXJzLCBibGVuZGluZywgY3NjKQogCSJt
ZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwtMmwiICAgICAgICAgICAtIG92ZXJsYXkgKDIgbGF5ZXJz
LCBibGVuZGluZywgY3NjKQogCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1yZG1hIiAgCQktIHJlYWQg
RE1BIC8gbGluZSBidWZmZXIKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYTEiICAgICAgICAg
ICAgLSBmdW5jdGlvbiBpcyBzYW1lIHdpdGggUkRNQSwgZmlmbyBzaXplIGlzIGRpZmZlcmVudAog
CSJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIiAgCQktIHdyaXRlIERNQQogCSJtZWRpYXRlayw8
Y2hpcD4tZGlzcC1jY29yciIgICAgICAgICAgICAtIGNvbG9yIGNvcnJlY3Rpb24KIAkibWVkaWF0
ZWssPGNoaXA+LWRpc3AtY29sb3IiIAkJLSBjb2xvciBwcm9jZXNzb3IKLS0gCjEuOC4xLjEuZGly
dHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
