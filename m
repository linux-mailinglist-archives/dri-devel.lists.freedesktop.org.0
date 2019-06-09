Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3733A4E7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 12:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA39B8919E;
	Sun,  9 Jun 2019 10:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013D58919E
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 10:56:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4FB662002C;
 Sun,  9 Jun 2019 12:56:18 +0200 (CEST)
Date: Sun, 9 Jun 2019 12:56:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [1/2] dt-bindings: display: panel: add AUO kd101n80-45na panel
 bindings
Message-ID: <20190609105617.GC28935@ravnborg.org>
References: <20190608112342.64416-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608112342.64416-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=mpaa-ttXAAAA:8 a=e5mUnYsNAAAA:8 a=GOHkJZeNjhEJBjOU3QsA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=6heAxKwa5pAsJatQ0mat:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSml0YW8uCgpCaW5kaW5nIGRvYyBmb3IgdGhpcyBwYW5lbCBsb29rcyBnb29kLgoKV2l0aCBh
ZGRlZCBkZXNjcmlwdGlvbiBmb3IgYXZkZCArIGF2ZWUgaXQgaXM6CgpSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKT24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDc6
MjM6NDFQTSArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBh
dW8ga2QxMDFuODAtNDVuYSBwYW5lbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGpp
dGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL2F1byxrZDEw
MW44MC00NW5hLnR4dCAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnR4
dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9hdW8sa2QxMDFuODAtNDVuYS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sa2QxMDFuODAtNDVuYS50eHQKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzcxNWNmNzAzNDMxCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnR4dAo+IEBAIC0wLDAgKzEsMzQgQEAKPiArQVVPIENv
cnBvcmF0aW9uIDEwLjEiIFdVWEdBIFRGVCBMQ0QgcGFuZWwKPiArCj4gK1JlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJhdW8sa2QxMDFuODAtNDVuYSIKPiAr
LSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVyIG9mIGEgRFNJIHBlcmlwaGVyYWwKPiAr
LSBlbmFibGUtZ3Bpb3M6IGEgR1BJTyBzcGVjIGZvciB0aGUgZW5hYmxlIHBpbgo+ICstIHBwMTgw
MC1zdXBwbHk6IGNvcmUgdm9sdGFnZSBzdXBwbHkKPiArLSBhdmRkLXN1cHBseTogCj4gKy0gYXZl
ZS1zdXBwbHk6IApEZXNjcmlwdGlvbnMgYXJlIG1pc3NpbmcgZm9yIHRoZSAyIHggc3VwcGx5LgoK
PiArLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQg
dG8gdGhlIHBhbmVsCj4gKwo+ICtUaGUgZGV2aWNlIG5vZGUgY2FuIGNvbnRhaW4gb25lICdwb3J0
JyBjaGlsZCBub2RlIHdpdGggb25lIGNoaWxkCj4gKydlbmRwb2ludCcgbm9kZSwgYWNjb3JkaW5n
IHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGluCj4gK21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0
LiBUaGlzIG5vZGUgc2hvdWxkIGRlc2NyaWJlIHBhbmVsJ3MgdmlkZW8gYnVzLgo+ICsKPiArRXhh
bXBsZToKPiArJmRzaSB7Cj4gKwkuLi4KPiArCXBhbmVsQDAgewo+ICsJCWNvbXBhdGlibGUgPSAi
YXVvLGtkMTAxbjgwLTQ1bmEiOwo+ICsJCXJlZyA9IDwwPjsKPiArCQllbmFibGUtZ3Bpb3MgPSA8
JnBpbyA0NSAwPjsKPiArCQlhdmRkLXN1cHBseSA9IDwmcHB2YXJuX2xjZD47Cj4gKwkJYXZlZS1z
dXBwbHkgPSA8JnBwdmFycF9sY2Q+Owo+ICsJCXBwMTgwMC1zdXBwbHkgPSA8JnBwMTgwMF9sY2Q+
Owo+ICsJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+Owo+ICsJCXN0YXR1cyA9ICJva2F5
IjsKPiArCQlwb3J0IHsKPiArCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKPiArCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmZHNpX291dD47Cj4gKwkJCX07Cj4gKwkJfTsKPiArCX07Cj4gK307Cj4gLS0g
Cj4gMi4yMS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
