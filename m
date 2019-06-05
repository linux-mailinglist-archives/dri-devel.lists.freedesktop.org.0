Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93336CC1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA148936E;
	Thu,  6 Jun 2019 07:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AF7898C4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:48 +0000 (UTC)
X-UUID: 1d256ffc735c4894bb2a6e13f1b5a2ee-20190605
X-UUID: 1d256ffc735c4894bb2a6e13f1b5a2ee-20190605
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 923531353; Wed, 05 Jun 2019 19:43:41 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:39 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 03/27] dt-bindings: mediatek: add ccorr description for mt8183 display
Date: Wed, 5 Jun 2019 19:42:42 +0800
Message-ID: <1559734986-7379-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
ZGlzcC50eHQKaW5kZXggMjQxOGM1Ni4uZTE0OTI0NSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQKQEAgLTMxLDYgKzMxLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAo
YWxsIGZ1bmN0aW9uIGJsb2Nrcyk6CiAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW92bC0ybCIgICAg
ICAgICAgIC0gb3ZlcmxheSAoMiBsYXllcnMsIGJsZW5kaW5nLCBjc2MpCiAJIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLXJkbWEiICAJCS0gcmVhZCBETUEgLyBsaW5lIGJ1ZmZlcgogCSJtZWRpYXRlayw8
Y2hpcD4tZGlzcC13ZG1hIiAgCQktIHdyaXRlIERNQQorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1j
Y29yciIgICAgICAgICAgICAtIGNvbG9yIGNvcnJlY3Rpb24KIAkibWVkaWF0ZWssPGNoaXA+LWRp
c3AtY29sb3IiIAkJLSBjb2xvciBwcm9jZXNzb3IKIAkibWVkaWF0ZWssPGNoaXA+LWRpc3AtYWFs
IiAgIAkJLSBhZGFwdGl2ZSBhbWJpZW50IGxpZ2h0IGNvbnRyb2xsZXIKIAkibWVkaWF0ZWssPGNo
aXA+LWRpc3AtZ2FtbWEiIAkJLSBnYW1tYSBjb3JyZWN0aW9uCi0tIAoxLjguMS4xLmRpcnR5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
