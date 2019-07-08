Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096BF63180
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7089B8F;
	Tue,  9 Jul 2019 07:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A993889AE6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:29 +0000 (UTC)
X-UUID: 07c15ecf5b7c49bb8b1b8eb48c00498d-20190709
X-UUID: 07c15ecf5b7c49bb8b1b8eb48c00498d-20190709
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 946001585; Tue, 09 Jul 2019 06:34:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:22 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 02/33] dt-bindings: mediatek: add ovl_2l description for mt8183
 display
Date: Tue, 9 Jul 2019 06:33:42 +0800
Message-ID: <1562625253-29254-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B645D0248E938B78F0C7FB1AB8607EC9CB76DD23066D784CADC3E0AB0EB365272000:8
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
eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCAyNyArKysrKysrKysrKy0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAppbmRleCA0NjRiOTJmLi44YzQ3MDBmIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkaXNwLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dApAQCAtMjcsMTkgKzI3LDIw
IEBAIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGRwaS50eHQuCiAKIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9j
a3MpOgogLSBjb21wYXRpYmxlOiAibWVkaWF0ZWssPGNoaXA+LWRpc3AtPGZ1bmN0aW9uPiIsIG9u
ZSBvZgotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiICAgLSBvdmVybGF5ICg0IGxheWVycywg
YmxlbmRpbmcsIGNzYykKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYSIgIC0gcmVhZCBETUEg
LyBsaW5lIGJ1ZmZlcgotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIiAgLSB3cml0ZSBETUEK
LQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtY29sb3IiIC0gY29sb3IgcHJvY2Vzc29yCi0JIm1lZGlh
dGVrLDxjaGlwPi1kaXNwLWFhbCIgICAtIGFkYXB0aXZlIGFtYmllbnQgbGlnaHQgY29udHJvbGxl
cgotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIgLSBnYW1tYSBjb3JyZWN0aW9uCi0JIm1l
ZGlhdGVrLDxjaGlwPi1kaXNwLW1lcmdlIiAtIG1lcmdlIHN0cmVhbXMgZnJvbSB0d28gUkRNQSBz
b3VyY2VzCi0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXNwbGl0IiAtIHNwbGl0IHN0cmVhbSB0byB0
d28gZW5jb2RlcnMKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIgIC0gZGF0YSBjb21wcmVz
c2lvbiBlbmdpbmUKLQkibWVkaWF0ZWssPGNoaXA+LWRzaSIgICAgICAgIC0gRFNJIGNvbnRyb2xs
ZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0Ci0JIm1lZGlhdGVrLDxjaGlwPi1kcGkiICAgICAgICAt
IERQSSBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHBpLnR4dAotCSJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1tdXRleCIgLSBkaXNwbGF5IG11dGV4Ci0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAg
ICAtIG92ZXJkcml2ZQorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiICAgCQktIG92ZXJsYXkg
KDQgbGF5ZXJzLCBibGVuZGluZywgY3NjKQorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwtMmwi
ICAgICAgICAgICAtIG92ZXJsYXkgKDIgbGF5ZXJzLCBibGVuZGluZywgY3NjKQorCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1yZG1hIiAgCQktIHJlYWQgRE1BIC8gbGluZSBidWZmZXIKKwkibWVkaWF0
ZWssPGNoaXA+LWRpc3Atd2RtYSIgIAkJLSB3cml0ZSBETUEKKwkibWVkaWF0ZWssPGNoaXA+LWRp
c3AtY29sb3IiIAkJLSBjb2xvciBwcm9jZXNzb3IKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtYWFs
IiAgIAkJLSBhZGFwdGl2ZSBhbWJpZW50IGxpZ2h0IGNvbnRyb2xsZXIKKwkibWVkaWF0ZWssPGNo
aXA+LWRpc3AtZ2FtbWEiIAkJLSBnYW1tYSBjb3JyZWN0aW9uCisJIm1lZGlhdGVrLDxjaGlwPi1k
aXNwLW1lcmdlIiAJCS0gbWVyZ2Ugc3RyZWFtcyBmcm9tIHR3byBSRE1BIHNvdXJjZXMKKwkibWVk
aWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiIAkJLSBzcGxpdCBzdHJlYW0gdG8gdHdvIGVuY29kZXJz
CisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXVmb2UiICAJCS0gZGF0YSBjb21wcmVzc2lvbiBlbmdp
bmUKKwkibWVkaWF0ZWssPGNoaXA+LWRzaSIgICAgICAgIAkJLSBEU0kgY29udHJvbGxlciwgc2Vl
IG1lZGlhdGVrLGRzaS50eHQKKwkibWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgIAkJLSBEUEkg
Y29udHJvbGxlciwgc2VlIG1lZGlhdGVrLGRwaS50eHQKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3At
bXV0ZXgiIAkJLSBkaXNwbGF5IG11dGV4CisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAJ
CS0gb3ZlcmRyaXZlCiAgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQyNzEyIGFu
ZCBtdDgxNzMuCiAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhl
IGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIHNwYWNlCiAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1
cHQgc2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrIChyZXF1aXJlZCwgZXhjZXB0IGZvcgot
LSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
