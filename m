Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9146315B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51198897F0;
	Tue,  9 Jul 2019 07:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0071689D39
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:29 +0000 (UTC)
X-UUID: 3ec56610b2c04157ae42253a1465ef2e-20190709
X-UUID: 3ec56610b2c04157ae42253a1465ef2e-20190709
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1218074293; Tue, 09 Jul 2019 06:34:25 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:24 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 04/33] dt-bindings: mediatek: add dither description for mt8183
 display
Date: Tue, 9 Jul 2019 06:33:44 +0800
Message-ID: <1562625253-29254-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpVcGRhdGUg
ZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGlvbiBmb3IgdGhlIGRpc3BsYXkgc3Vic3lzdGVt
IGZvcgpNZWRpYXRlayBNVDgxODMgU09DcwoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8
eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZGlzcC50eHQKaW5kZXggY2Y1ZmIwOC4uYWZkM2M5MCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQKQEAgLTMzLDYgKzMzLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAo
YWxsIGZ1bmN0aW9uIGJsb2Nrcyk6CiAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXdkbWEiICAJCS0g
d3JpdGUgRE1BCiAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLWNjb3JyIiAgICAgICAgICAgIC0gY29s
b3IgY29ycmVjdGlvbgogCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1jb2xvciIgCQktIGNvbG9yIHBy
b2Nlc3NvcgorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1kaXRoZXIiICAgICAgICAgICAtIGRpdGhl
cgogCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiICAgCQktIGFkYXB0aXZlIGFtYmllbnQgbGln
aHQgY29udHJvbGxlcgogCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIgCQktIGdhbW1hIGNv
cnJlY3Rpb24KIAkibWVkaWF0ZWssPGNoaXA+LWRpc3AtbWVyZ2UiIAkJLSBtZXJnZSBzdHJlYW1z
IGZyb20gdHdvIFJETUEgc291cmNlcwotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
