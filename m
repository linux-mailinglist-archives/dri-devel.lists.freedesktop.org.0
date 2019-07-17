Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B68B6B515
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 05:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D5B89F31;
	Wed, 17 Jul 2019 03:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 133DD89F31
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 03:40:20 +0000 (UTC)
X-UUID: 7d6be4e943c14964831c2514d83a5888-20190717
X-UUID: 7d6be4e943c14964831c2514d83a5888-20190717
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 499689010; Wed, 17 Jul 2019 11:40:17 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 11:40:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 11:40:13 +0800
Message-ID: <1563334813.29169.9.camel@mtksdaap41>
Subject: Re: [PATCH v4, 04/33] dt-bindings: mediatek: add dither description
 for mt8183 display
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 11:40:13 +0800
In-Reply-To: <1562625253-29254-5-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D6842BC495CF62E915E073AAD261C7B66CB325E65E78ABFCF8D683C1EF2B27432000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCgpUaGlzIHZlcnNpb24gaXMgaWRlbnRpY2FsIHRvIHByZXZpb3VzIHZl
cnNpb24sIGFuZCBSb2IgaGFzIGdhdmUgYQonUmV2aXdlZC1ieScgdGFnIG9uIHByZXZpb3VzIHZl
cnNpb24sIHNvIHlvdSBzaG91bGQga2VlcCB0aGF0IHRhZyBvbgp0aGlzIHZlcnNpb24sIHNvIHdl
IGRvbid0IG5lZWQgdG8gcmV2aWV3IHRoaXMgcGF0Y2ggYWdhaW4uCgpSZWdhcmRzLApDSwoKCk9u
IFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozMyArMDgwMCwgeW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20+Cj4gCj4gVXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRpb24gZm9yIHRoZSBk
aXNwbGF5IHN1YnN5c3RlbSBmb3IKPiBNZWRpYXRlayBNVDgxODMgU09Dcwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkaXNwLnR4dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IGluZGV4IGNmNWZiMDgu
LmFmZDNjOTAgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+
IEBAIC0zMyw2ICszMyw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9j
a3MpOgo+ICAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXdkbWEiICAJCS0gd3JpdGUgRE1BCj4gIAki
bWVkaWF0ZWssPGNoaXA+LWRpc3AtY2NvcnIiICAgICAgICAgICAgLSBjb2xvciBjb3JyZWN0aW9u
Cj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3AtY29sb3IiIAkJLSBjb2xvciBwcm9jZXNzb3IKPiAr
CSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1kaXRoZXIiICAgICAgICAgICAtIGRpdGhlcgo+ICAJIm1l
ZGlhdGVrLDxjaGlwPi1kaXNwLWFhbCIgICAJCS0gYWRhcHRpdmUgYW1iaWVudCBsaWdodCBjb250
cm9sbGVyCj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiIAkJLSBnYW1tYSBjb3JyZWN0
aW9uCj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3AtbWVyZ2UiIAkJLSBtZXJnZSBzdHJlYW1zIGZy
b20gdHdvIFJETUEgc291cmNlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
