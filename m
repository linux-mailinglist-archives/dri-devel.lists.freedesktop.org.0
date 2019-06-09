Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB33A4BE
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 12:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B088929B;
	Sun,  9 Jun 2019 10:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42EE8929B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 10:32:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C6F642002D;
 Sun,  9 Jun 2019 12:32:42 +0200 (CEST)
Date: Sun, 9 Jun 2019 12:32:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [1/2] dt-bindngs: display: panel: Add BOE tv101wum-nl6 panel
 bindings
Message-ID: <20190609103241.GA28935@ravnborg.org>
References: <20190608070230.55381-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608070230.55381-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=GOHkJZeNjhEJBjOU3QsA:9 a=zQRrZ5hHoVty9KUv:21 a=G8XELezRatH2Uwd4:21
 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
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

SGkgSml0YW8KCkFsd2F5cyBnb29kIHRvIHNlZSBtb3JlIHBhbmVscyBhZGRlZC4KCk9uIFNhdCwg
SnVuIDA4LCAyMDE5IGF0IDAzOjAyOjI5UE0gKzA4MDAsIEppdGFvIFNoaSB3cm90ZToKPiBBZGQg
ZG9jdW1lbnRhdGlvbiBmb3IgYm9lIHR2MTAxd3VtLW4xNiBwYW5lbC4KClRoZSBjaGFuZ2Vsb2cg
c2F5cyB0djEwMXd1bS1uMTYgYnV0IHRoZSBjb21wYXRpYmxlIHNheXMgdHYxMDF3dW0tbmw2LgpQ
bGVhc2UgcGljayB0aGUgcmlnaHQgb25lIGFuZCBiZSBjb25zaXN0ZW50LiAobnVtYmVyIG9uZSAn
MScgdmVyc3VzCmNoYXJhY3RlciAnbCcpCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8
aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkvcGFuZWwvYm9lLHR2
MTAxd3VtLW5sNi50eHQgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50
eHQKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnR4dAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yYTg0NzM1ZDc0MmQKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQKPiBAQCAtMCwwICsxLDM0IEBACj4gK0JvZSBDb3Jw
b3JhdGlvbiAxMC4xIiBXVVhHQSBURlQgTENEIHBhbmVsCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0
aWVzOgo+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiYm9lLHR2MTAxd3VtIgpUaGUgZXhhbXBs
ZSB1c2VzICJib2UsdHYxMDF3dW0tbmw2Iiwgd2hpY2ggbWF0Y2hlcyB0aGUgZmlsZW5hbWUuClBs
ZWFzZSBmaXggc28gaXQgaXMgdGhlIHNhbWUgYWxsIG92ZXIuCgo+ICstIHJlZzogdGhlIHZpcnR1
YWwgY2hhbm5lbCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAo+ICstIGVuYWJsZS1ncGlvczog
YSBHUElPIHNwZWMgZm9yIHRoZSBlbmFibGUgcGluCj4gKy0gcHAxODAwLXN1cHBseTogY29yZSB2
b2x0YWdlIHN1cHBseQo+ICstIGF2ZGQtc3VwcGx5OiAKPiArLSBhdmVlLXN1cHBseTogCk1pc3Np
bmcgZGVzY3JpcHRpb25zIC0gcGxlYXNlIGFkZC4KPiArLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2Yg
dGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCj4gKwo+ICtUaGUgZGV2
aWNlIG5vZGUgY2FuIGNvbnRhaW4gb25lICdwb3J0JyBjaGlsZCBub2RlIHdpdGggb25lIGNoaWxk
Cj4gKydlbmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGlu
Cj4gK21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0LiBUaGlzIG5vZGUgc2hvdWxkIGRlc2NyaWJl
IHBhbmVsJ3MgdmlkZW8gYnVzLgo+ICsKPiArRXhhbXBsZToKPiArJmRzaSB7Cj4gKwkuLi4KPiAr
CXBhbmVsQDAgewo+ICsJCWNvbXBhdGlibGUgPSAiYm9lLHR2MTAxd3VtLW5sNiI7Cj4gKwkJcmVn
ID0gPDA+Owo+ICsJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IDA+Owo+ICsJCWF2ZGQtc3VwcGx5
ID0gPCZwcHZhcm5fbGNkPjsKPiArCQlhdmVlLXN1cHBseSA9IDwmcHB2YXJwX2xjZD47Cj4gKwkJ
cHAxODAwLXN1cHBseSA9IDwmcHAxODAwX2xjZD47Cj4gKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGln
aHRfbGNkMD47Cj4gKwkJc3RhdHVzID0gIm9rYXkiOwo+ICsJCXBvcnQgewo+ICsJCQlwYW5lbF9p
bjogZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfb3V0PjsKPiArCQkJ
fTsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKUGxl
YXNlIGFkZCBuZXdsaW5lLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
