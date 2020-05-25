Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE41E0FF8
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 15:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C7F89E41;
	Mon, 25 May 2020 13:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B368489E3F;
 Mon, 25 May 2020 13:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 89B452A6042;
 Mon, 25 May 2020 15:56:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id RlKsm_CYPJYN; Mon, 25 May 2020 15:56:49 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 362682A6016;
 Mon, 25 May 2020 15:56:49 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jdDay-000QSJ-Ie; Mon, 25 May 2020 15:56:48 +0200
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
To: uday kiran pichika <udaykiran.pichika@gmail.com>
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <53679f9b-4d81-cb46-72bb-02ca05fb303f@daenzer.net>
Date: Mon, 25 May 2020 15:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
Content-Language: en-CA
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yNSAzOjMxIHAubS4sIHVkYXkga2lyYW4gcGljaGlrYSB3cm90ZToKPiBIZWxs
bywKPiAKPiBBbSB3b3JraW5nIG9uIGVuYWJsaW5nIHRoZSBBZGFwdGl2ZSBzeW5jIGZlYXR1cmUg
YXMgcGFydCBvZiB0aGUKPiBYb3JnL01vZGVzZXR0aW5nIEREWCBkcml2ZXIgYnkgdGFraW5nIHRo
ZSByZWZlcmVuY2Ugb2YgQU1EIEREWCBEcml2ZXIKPiAoeGY4Ni12aWRlby1hbWRncHUpLiBCZWxv
dyBpcyB0aGUgY29tbWl0IHdoaWNoIGkgc3VibWl0dGVkLgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9waWNoaWthL3hzZXJ2ZXIvLS9jb21taXQvNjgyNTY1YTY0NWJkYTczNzFjYzM3
MzFlZTgwNWNjNGEwYWNlODBkYgo+IAo+IAo+IEkgaGF2ZSBtYWRlIHRoZSBiZWxvdyBjaGFuZ2Vz
IHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUKPiAxLiBFbmFibGUgQWRhcHRpdmUgc3luYyBpbiBHcmFw
aGljcyBEcml2ZXIKPiAyLiBBZGRlZCBYb3JnLmNvbmYgZmlsZSB3aXRoIFZhcmlhYmxlUmVmcmVz
aCBwcm9wZXJ0eSB3aGljaCBpcyByZWFkIGluIHRoZQo+IE1vZGVzZXR0aW5nIGRyaXZlciAtLT4g
VGhpcyBpcyB3b3JraW5nIGZpbmUuCj4gCj4gQWZ0ZXIgdGFraW5nIHRoZSBhYm92ZSBjaGFuZ2Vz
LCBhbSBvYnNlcnZpbmcgdGhhdCBBZGFwdGl2ZSBzeW5jIGlzIG5vdAo+IHdvcmtpbmcuCj4gCj4g
QmVsb3cgYXJlIG15IG9ic2VydmF0aW9ucy4KPiAxLiBsb2FkZXJfZHJpM19oZWxwZXIuYyAgLS0+
IEFkYXB0aXZlIHN5bmMgcHJvcGVydHkgaXMgYmVpbmcgc2V0IG9uY2UgdGhlCj4gc3lzdGVtIGlz
IGJvb3RlZCBzdWNjZXNzZnVsbHkgb24gb25lIFdpbmRvdy4gT25jZQo+IHNldF9hZGFwdGl2ZV9z
eW5jX3Byb3BlcnR5KCkgbWV0aG9kIGdldHMgY2FsbGVkLCBhZGFwdGl2ZV9zeW5jX2FjdGl2ZSBm
bGFnCj4gaXMgc2V0dGluZyB0byB0cnVlLiBGcm9tIHRoZSBuZXh0IHRpbWUsIHdoZW4gZnVsbHNj
cmVlbiBhcHBsaWNhdGlvbnMgYXJlCj4gbG9hZGVkLCB0aGlzIHByb3BlcnR5IG5ldmVyIGdldHMg
c2V0IG9uIGFueSB3aW5kb3cuCj4gMi4gT25jZSB0aGlzIHByb3BlcnR5IGlzIGJlaW5nIHNldCwg
cmVjZWl2ZWQgYSBub3RpZmljYXRpb24gaW4gbW9kZXNldHRpbmcKPiBkZHggZHJpdmVyIGFuZCBy
ZWFkIHRoZSBwcm9wZXJ0eSBmcm9tIHRoZSBTdHVmZi0+d2luZG93Lgo+IDMuIEJ1dCB3aGVuIHRo
ZSBmdWxsc2NyZWVuIGFwcGxpY2F0aW9uKEVpdGhlciBET1RBIG9yIFhvbm90aWMpLCBub3QKPiBv
YnNlcnZpbmcgdGhhdCB0aGlzIHByb3BldHkgaXMgbm90IGJlaW5nIHNldCBvbiBhbnkgYXBwIHdp
bmRvdy4KPiAKPiBDYW4gYW55IG9uZSBwbGVhc2UgaGVscCBtZSB3aHkgdGhpcyBwcm9wZXJ0eSBp
cyBub3QgYmVpbmcgc2V0IGluIHRoZQo+IGFwcGxpY2F0aW9uIHdpbmRvd3MgPwoKRnJvbSB5b3Vy
IGRlc2NyaXB0aW9uLCBpdCBkb2VzIGdldCBzZXQgZm9yIHNvbWUgd2luZG93cy4gSnVzdCBhcHBh
cmVudGx5Cm5vdCBmb3IgdGhlIHdpbmRvdyB3aGljaCBpcyBmdWxsc2NyZWVuIGFuZCB1c2luZyBw
YWdlIGZsaXBwaW5nICh5b3VyCmRlc2NyaXB0aW9uIGlzIGEgYml0IHZhZ3VlIHRvIGJlIHN1cmUg
dGhvdWdoKS4KCkhhdmUgeW91IHRyaWVkIHdpdGggYSBzaW1wbGVyIHRlc3QgYXBwLCBlLmcuCgog
Z2x4Z2VhcnMgLWZ1bGxzY3JlZW4KCj8KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0
d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZl
bG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
