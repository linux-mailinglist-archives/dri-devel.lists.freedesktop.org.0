Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5977A328E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431FD6E329;
	Fri, 30 Aug 2019 08:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id E52AD6E14E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:09 +0000 (UTC)
X-UUID: 777bef8089a94782ae530c2ecb38cc77-20190829
X-UUID: 777bef8089a94782ae530c2ecb38cc77-20190829
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1364499389; Thu, 29 Aug 2019 22:51:04 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:08 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5,
 02/32] dt-bindings: mediatek: add ovl_2l description for mt8183
 display
Date: Thu, 29 Aug 2019 22:50:24 +0800
Message-ID: <1567090254-15566-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRpc3AudHh0ICAgIHwgMjcgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3Au
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQKaW5kZXggNDY0YjkyZi4uOGM0NzAwZiAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZGlzcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKQEAgLTI3LDE5ICsyNywyMCBAQCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkudHh0
LgogCiBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxvY2tzKToKIC0gY29tcGF0
aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kaXNwLTxmdW5jdGlvbj4iLCBvbmUgb2YKLQkibWVkaWF0
ZWssPGNoaXA+LWRpc3Atb3ZsIiAgIC0gb3ZlcmxheSAoNCBsYXllcnMsIGJsZW5kaW5nLCBjc2Mp
Ci0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXJkbWEiICAtIHJlYWQgRE1BIC8gbGluZSBidWZmZXIK
LQkibWVkaWF0ZWssPGNoaXA+LWRpc3Atd2RtYSIgIC0gd3JpdGUgRE1BCi0JIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLWNvbG9yIiAtIGNvbG9yIHByb2Nlc3NvcgotCSJtZWRpYXRlayw8Y2hpcD4tZGlz
cC1hYWwiICAgLSBhZGFwdGl2ZSBhbWJpZW50IGxpZ2h0IGNvbnRyb2xsZXIKLQkibWVkaWF0ZWss
PGNoaXA+LWRpc3AtZ2FtbWEiIC0gZ2FtbWEgY29ycmVjdGlvbgotCSJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1tZXJnZSIgLSBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJETUEgc291cmNlcwotCSJtZWRp
YXRlayw8Y2hpcD4tZGlzcC1zcGxpdCIgLSBzcGxpdCBzdHJlYW0gdG8gdHdvIGVuY29kZXJzCi0J
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLXVmb2UiICAtIGRhdGEgY29tcHJlc3Npb24gZW5naW5lCi0J
Im1lZGlhdGVrLDxjaGlwPi1kc2kiICAgICAgICAtIERTSSBjb250cm9sbGVyLCBzZWUgbWVkaWF0
ZWssZHNpLnR4dAotCSJtZWRpYXRlayw8Y2hpcD4tZHBpIiAgICAgICAgLSBEUEkgY29udHJvbGxl
ciwgc2VlIG1lZGlhdGVrLGRwaS50eHQKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtbXV0ZXgiIC0g
ZGlzcGxheSBtdXRleAotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vZCIgICAgLSBvdmVyZHJpdmUK
KwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atb3ZsIiAgIAkJLSBvdmVybGF5ICg0IGxheWVycywgYmxl
bmRpbmcsIGNzYykKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atb3ZsLTJsIiAgICAgICAgICAgLSBv
dmVybGF5ICgyIGxheWVycywgYmxlbmRpbmcsIGNzYykKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3At
cmRtYSIgIAkJLSByZWFkIERNQSAvIGxpbmUgYnVmZmVyCisJIm1lZGlhdGVrLDxjaGlwPi1kaXNw
LXdkbWEiICAJCS0gd3JpdGUgRE1BCisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLWNvbG9yIiAJCS0g
Y29sb3IgcHJvY2Vzc29yCisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLWFhbCIgICAJCS0gYWRhcHRp
dmUgYW1iaWVudCBsaWdodCBjb250cm9sbGVyCisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLWdhbW1h
IiAJCS0gZ2FtbWEgY29ycmVjdGlvbgorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tZXJnZSIgCQkt
IG1lcmdlIHN0cmVhbXMgZnJvbSB0d28gUkRNQSBzb3VyY2VzCisJIm1lZGlhdGVrLDxjaGlwPi1k
aXNwLXNwbGl0IiAJCS0gc3BsaXQgc3RyZWFtIHRvIHR3byBlbmNvZGVycworCSJtZWRpYXRlayw8
Y2hpcD4tZGlzcC11Zm9lIiAgCQktIGRhdGEgY29tcHJlc3Npb24gZW5naW5lCisJIm1lZGlhdGVr
LDxjaGlwPi1kc2kiICAgICAgICAJCS0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkc2ku
dHh0CisJIm1lZGlhdGVrLDxjaGlwPi1kcGkiICAgICAgICAJCS0gRFBJIGNvbnRyb2xsZXIsIHNl
ZSBtZWRpYXRlayxkcGkudHh0CisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW11dGV4IiAJCS0gZGlz
cGxheSBtdXRleAorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vZCIgICAgCQktIG92ZXJkcml2ZQog
ICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10MjcxMiBhbmQgbXQ4MTczLgogLSBy
ZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBmdW5jdGlvbiBibG9j
ayByZWdpc3RlciBzcGFjZQogLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9t
IHRoZSBmdW5jdGlvbiBibG9jayAocmVxdWlyZWQsIGV4Y2VwdCBmb3IKLS0gCjEuOC4xLjEuZGly
dHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
