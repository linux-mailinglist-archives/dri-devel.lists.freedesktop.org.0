Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBC4A782A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 03:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0211C894C5;
	Wed,  4 Sep 2019 01:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73753894C5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 01:45:05 +0000 (UTC)
X-UUID: 495aaa361dcc4f2f96798d243577cc31-20190904
X-UUID: 495aaa361dcc4f2f96798d243577cc31-20190904
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1704885031; Wed, 04 Sep 2019 09:45:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Sep 2019 09:44:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Sep 2019 09:44:59 +0800
Message-ID: <1567561500.6949.2.camel@mtksdaap41>
Subject: Re: [PATCH v5, 04/32] dt-bindings: mediatek: add dither description
 for mt8183 display
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 4 Sep 2019 09:45:00 +0800
In-Reply-To: <1567090254-15566-5-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8B98B277B5E3A6E32C1A165EF9AB839D4AC8A19E96BD6DAAB17592F58A0729AF2000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9j
dW1lbnRpb24gZm9yIHRoZSBkaXNwbGF5IHN1YnN5c3RlbSBmb3IKPiBNZWRpYXRlayBNVDgxODMg
U09DcwoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dC01LjUgWzFdLCB0aGFua3MuCgpbMV0K
aHR0cHM6Ly9naXRodWIuY29tL2NraHUtbWVkaWF0ZWsvbGludXguZ2l0LXRhZ3MvY29tbWl0cy9t
ZWRpYXRlay1kcm0tbmV4dC01LjUKClJlZ2FyZHMsCkNLCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaCBhdCBrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IGluZGV4IGNmNWZiMDguLmFmZDNjOTAgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IEBAIC0zMyw2ICszMyw3IEBA
IFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgo+ICAJIm1lZGlhdGVr
LDxjaGlwPi1kaXNwLXdkbWEiICAJCS0gd3JpdGUgRE1BCj4gIAkibWVkaWF0ZWssPGNoaXA+LWRp
c3AtY2NvcnIiICAgICAgICAgICAgLSBjb2xvciBjb3JyZWN0aW9uCj4gIAkibWVkaWF0ZWssPGNo
aXA+LWRpc3AtY29sb3IiIAkJLSBjb2xvciBwcm9jZXNzb3IKPiArCSJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1kaXRoZXIiICAgICAgICAgICAtIGRpdGhlcgo+ICAJIm1lZGlhdGVrLDxjaGlwPi1kaXNw
LWFhbCIgICAJCS0gYWRhcHRpdmUgYW1iaWVudCBsaWdodCBjb250cm9sbGVyCj4gIAkibWVkaWF0
ZWssPGNoaXA+LWRpc3AtZ2FtbWEiIAkJLSBnYW1tYSBjb3JyZWN0aW9uCj4gIAkibWVkaWF0ZWss
PGNoaXA+LWRpc3AtbWVyZ2UiIAkJLSBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJETUEgc291cmNl
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
