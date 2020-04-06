Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A245D19FAF7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 19:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E256E447;
	Mon,  6 Apr 2020 17:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3180B6E447;
 Mon,  6 Apr 2020 17:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4B41B2A6045;
 Mon,  6 Apr 2020 19:04:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QEGsVhUm_wf5; Mon,  6 Apr 2020 19:04:50 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id E3E9F2A6042;
 Mon,  6 Apr 2020 19:04:49 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jLVB2-000StY-Ap; Mon, 06 Apr 2020 19:04:48 +0200
Subject: Re: gitlab.fd.o financial situation and impact on services
To: Rob Clark <robdclark@gmail.com>, Adam Jackson <ajax@redhat.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
 <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
 <CAAxE2A5zSy7Rh6xyPW8NCqj3q0_8F7yw8tAXx=_z8+mJ-u2uWw@mail.gmail.com>
 <3cddf1aa-5072-af7c-c51e-c16039176f6c@daenzer.net>
 <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
 <f4d856925111b77012cabb255d6a880ae5637b41.camel@redhat.com>
 <CAF6AEGtnxmCCakT65zJ7BY=11E_+DgttamBggD10SahtsXuxEQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <0d2d9669-3240-ff60-328d-77933499442a@daenzer.net>
Date: Mon, 6 Apr 2020 19:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtnxmCCakT65zJ7BY=11E_+DgttamBggD10SahtsXuxEQ@mail.gmail.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNC0wNiA2OjM0IHAubS4sIFJvYiBDbGFyayB3cm90ZToKPgo+IFRoZSBpZGVhbCB0
aGluZyB3b3VsZCBiZSB0byBiZSBhYmxlIHRvIGNsaWNrIGFueSBqb2JzIHRoYXQgd2Ugd2FudCB0
bwo+IHJ1biwgc2F5ICJhcm02NF9hNjMwX2dsZXMzMSIsIGFuZCBmb3IgZ2l0bGFiIHRvIHJlYWxp
emUgdGhhdCBpdCBuZWVkcwo+IHRvIGF1dG9tYXRpY2FsbHkgdHJpZ2dlciBkZXBlbmRlbmNpZXMg
b2YgdGhhdCBqb2IgKG1lc29uLWFybTY0LCBhbmQKPiBhcm1fYnVpbGQrYXJtX3Rlc3QpLiAgQnV0
IG5vdCBzdXJlIGlmIHRoYXQgaXMgYSB0aGluZyBnaXRsYWIgY2FuIGRvLgoKTm90IHRoYXQgSSBr
bm93IG9mLiBUaGUgZGVwZW5kZW5jeSBoYW5kbGluZyBpcyBzdGlsbCBwcmV0dHkgcnVkaW1lbnRh
cnkKaW4gZ2VuZXJhbC4KCgo+IFRyaWdnZXJpbmcganVzdCB0aGUgZmlyc3QgY29udGFpbmVyIGpv
YnMgYW5kIGhhdmluZyBldmVyeXRoaW5nIGZyb20KPiB0aGVyZSBydW4gYXV0b21hdGljYWxseSB3
b3VsZCBiZSBvayBpZiB0aGUgY3VycmVudCBydWxlcyB0byBmaWx0ZXIgb3V0Cj4gdW5uZWVkZWQg
am9icyBzdGlsbCBhcHBseSwgaWUuIGEgcGFuZnJvc3QgY2hhbmdlIGlzbid0IHRyaWdnZXJpbmcK
PiBmcmVlZHJlbm8gQ0kgam9icyBhbmQgdmlzYSB2ZXJzYS4gIEJ1dCB0YmggSSBkb24ndCB1bmRl
cnN0YW5kIGVub3VnaAo+IG9mIHdoYXQgdGhhdCBNUiBpcyBkb2luZyB0byB1bmRlcnN0YW5kIGlm
IHRoYXQgaXMgd2hhdCBpdCBkb2VzLiAgKEl0Cj4gd2FzIHN1Z2dlc3RlZCBvbiBJUkMgdGhhdCB0
aGlzIGlzIHByb2JhYmx5IHdoYXQgaXQgZG9lcy4pCgpJdCBpcy4gRmlsdGVyZWQgam9icyBkb24n
dCBleGlzdCBhdCBhbGwgaW4gdGhlIHBpcGVsaW5lLCBzbyB0aGV5IGNhbid0CmJlIHRyaWdnZXJl
ZCBieSBhbnkgbWVhbnMuIDopCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUg
ZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
