Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA87E332
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 21:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3646E791;
	Thu,  1 Aug 2019 19:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0108.hostedemail.com
 [216.40.44.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646386E791
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 19:16:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id C848318029123;
 Thu,  1 Aug 2019 19:16:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1500:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3867:3868:3871:3872:3874:4321:4605:5007:6742:7576:9040:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13095:13311:13357:13439:14181:14659:14721:21080:21433:21451:21611:21627:30029:30054:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: ring06_8f6c4551ca725
X-Filterd-Recvd-Size: 3026
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Thu,  1 Aug 2019 19:16:24 +0000 (UTC)
Message-ID: <ce8c8a7342282467c3b681fd1b0874817250c16e.camel@perches.com>
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes
From: Joe Perches <joe@perches.com>
To: Alex Deucher <alexdeucher@gmail.com>, Colin King <colin.king@canonical.com>
Date: Thu, 01 Aug 2019 12:16:23 -0700
In-Reply-To: <CADnq5_OdBM83zkkgtjwzQ0jqsiDP5wZoMXioGcq4mycX2=Tavw@mail.gmail.com>
References: <20190801083941.4230-1-colin.king@canonical.com>
 <CADnq5_OdBM83zkkgtjwzQ0jqsiDP5wZoMXioGcq4mycX2=Tavw@mail.gmail.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA4LTAxIGF0IDE1OjAyIC0wNDAwLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4g
QXBwbGllZC4gIHRoYW5rcyEKPiAKPiBBbGV4Cj4gCj4gT24gVGh1LCBBdWcgMSwgMjAxOSBhdCA0
OjM5IEFNIENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPiBG
cm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+ID4gCj4gPiBU
aGVyZSBhcmUgYSBmZXcgc3BlbGxpbmcgbWlzdGFrZXMgInVua25vdyIgLT4gInVua25vd24iIGFu
ZAo+ID4gImVuYWJlbGQiIC0+ICJlbmFibGVkIi4gRml4IHRoZXNlLgpbXQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpbXQo+ID4gQEAgLTM5LDcgKzM5LDcg
QEAgc3RhdGljIGNvbnN0IGNoYXIqIF9fc211X21lc3NhZ2VfbmFtZXNbXSA9IHsKPiA+ICBjb25z
dCBjaGFyICpzbXVfZ2V0X21lc3NhZ2VfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51
bSBzbXVfbWVzc2FnZV90eXBlIHR5cGUpCj4gPiAgewo+ID4gICAgICAgICBpZiAodHlwZSA8IDAg
fHwgdHlwZSA+IFNNVV9NU0dfTUFYX0NPVU5UKQoKVGhpcyBsb29rcyBsaWtlIGFuIG9mZi1ieS1v
bmUgdGVzdCBhZ2FpbnN0ClNNVV9NU0dfTUFYX0NPVU5UIHdoZXJlIHR5cGUKc2hvdWxkIGJlID49
Cgo+ID4gLSAgICAgICAgICAgICAgIHJldHVybiAidW5rbm93IHNtdSBtZXNzYWdlIjsKPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gInVua25vd24gc211IG1lc3NhZ2UiOwo+ID4gICAgICAgICBy
ZXR1cm4gX19zbXVfbWVzc2FnZV9uYW1lc1t0eXBlXTsKW10KPiA+IEBAIC01Miw3ICs1Miw3IEBA
IHN0YXRpYyBjb25zdCBjaGFyKiBfX3NtdV9mZWF0dXJlX25hbWVzW10gPSB7Cj4gPiAgY29uc3Qg
Y2hhciAqc211X2dldF9mZWF0dXJlX25hbWUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0g
c211X2ZlYXR1cmVfbWFzayBmZWF0dXJlKQo+ID4gIHsKPiA+ICAgICAgICAgaWYgKGZlYXR1cmUg
PCAwIHx8IGZlYXR1cmUgPiBTTVVfRkVBVFVSRV9DT1VOVCkKCmhlcmUgdG9vCgo+ID4gLSAgICAg
ICAgICAgICAgIHJldHVybiAidW5rbm93IHNtdSBmZWF0dXJlIjsKPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gInVua25vd24gc211IGZlYXR1cmUiOwo+ID4gICAgICAgICByZXR1cm4gX19zbXVf
ZmVhdHVyZV9uYW1lc1tmZWF0dXJlXTsKClBlcmhhcHMgaW5zdGVhZCBpdCBzaG91bGQgYmUgYWdh
aW5zdCBBUlJBWV9TSVpFKF9fc211Xzxmb28+KQoKQWxzbywgdGhlICBfX1NNVV9EVU1NWV9NQVAg
bWFjcm8gaXMgdW5uZWNlc3NhcmlseSBjb21wbGV4LgoKSXQgbWlnaHQgYmUgYmV0dGVyIHRvIGhh
dmUgc29tZSBkaXJlY3QKaW5kZXggYW5kIG5hbWUgc3RydWN0IGxpa2UKCnN0cnVjdCBlbnVtX25h
bWUgewoJaW50IHZhbDsKCWNvbnN0IGNoYXIgKm5hbWU7Cn07CgpBbmQgd2FsayB0aGF0LgoKUGVy
aGFwcyBhZGQgYSBtYWNybyBsaWtlCgojZGVmaW5lIGVudW1fbWFwKGUpCgl7LnZhbCA9IGUsIC5u
YW1lID0gI2V9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
