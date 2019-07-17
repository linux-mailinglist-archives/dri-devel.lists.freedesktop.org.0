Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EAA6B506
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 05:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74F6E222;
	Wed, 17 Jul 2019 03:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 412A56E223
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 03:37:48 +0000 (UTC)
X-UUID: d0db6bff8b214815abb3b0db654177db-20190717
X-UUID: d0db6bff8b214815abb3b0db654177db-20190717
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1155228632; Wed, 17 Jul 2019 11:37:33 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 11:37:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 11:37:31 +0800
Message-ID: <1563334651.29169.8.camel@mtksdaap41>
Subject: Re: [PATCH v4, 03/33] dt-bindings: mediatek: add ccorr description
 for mt8183 display
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 11:37:31 +0800
In-Reply-To: <1562625253-29254-4-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 403168DAAE7D0F5F3260CBF4E27C82B0F49F3568C5D9161274FEC2680BC066432000:8
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
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IGluZGV4IDhjNDcwMGYu
LmNmNWZiMDggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+
IEBAIC0zMSw2ICszMSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9j
a3MpOgo+ICAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW92bC0ybCIgICAgICAgICAgIC0gb3Zlcmxh
eSAoMiBsYXllcnMsIGJsZW5kaW5nLCBjc2MpCj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRt
YSIgIAkJLSByZWFkIERNQSAvIGxpbmUgYnVmZmVyCj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3At
d2RtYSIgIAkJLSB3cml0ZSBETUEKPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1jY29yciIgICAg
ICAgICAgICAtIGNvbG9yIGNvcnJlY3Rpb24KPiAgCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1jb2xv
ciIgCQktIGNvbG9yIHByb2Nlc3Nvcgo+ICAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLWFhbCIgICAJ
CS0gYWRhcHRpdmUgYW1iaWVudCBsaWdodCBjb250cm9sbGVyCj4gIAkibWVkaWF0ZWssPGNoaXA+
LWRpc3AtZ2FtbWEiIAkJLSBnYW1tYSBjb3JyZWN0aW9uCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
