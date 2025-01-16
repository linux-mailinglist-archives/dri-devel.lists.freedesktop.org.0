Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308CA1306C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49EE10E53E;
	Thu, 16 Jan 2025 01:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Fa25WADw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2271010E53E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=/hoWycnlr3VcvIdYrgH7FLn6/aiPfxBaNP33c2tQ4p8=; b=F
 a25WADwJLDYzTe3ZIKficDonIUnOW2p14i1qXo25jyEb4G2fP/8JC7udMyDXV39E
 +llLoER8kJCbOE4ZBv5LxavVaEckYxZppc6TshiUy55xqNc9IkrIyg+x0qxhYJ/g
 TPAtfGc93IisaRGx9hUkV2gY6tniIBHg7qBmYg55yU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Thu, 16 Jan 2025 09:04:42 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 16 Jan 2025 09:04:42 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:Re: Re: Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAD=FV=WHvSn1ZLHXvkmsic1xyryYYhnTAFNUeNRYjN-JdR5jRA@mail.gmail.com>
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
 <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
 <224024ea.917c.19469759369.Coremail.andyshrk@163.com>
 <CAD=FV=WHvSn1ZLHXvkmsic1xyryYYhnTAFNUeNRYjN-JdR5jRA@mail.gmail.com>
X-NTES-SC: AL_Qu2YBPWTtkwj5CSZZulS/DNQ2YpmHKvs4olgqcQkZd0qqTHPyz4QZ0BuLUbI3d6ol2kUQ1xWw/6B+CdgTwkJ
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2e6df663.a30.1946ca41db7.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgD3348qW4hnvxVYAA--.35662W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRbWXmeIUCDVrQAEsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERvdWcsCgrlnKggMjAyNS0wMS0xNiAwMTo1MToxNe+8jCJEb3VnIEFuZGVyc29uIiA8ZGlh
bmRlcnNAY2hyb21pdW0ub3JnPiDlhpnpgZPvvJoKPkhpLAo+Cj5PbiBXZWQsIEphbiAxNSwgMjAy
NSBhdCAyOjE14oCvQU0gQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+Pgo+Pgo+
PiBIaSBEb3VnLAo+Pgo+PiDlnKggMjAyNS0wMS0xNSAwMDo0NDo0Me+8jCJEb3VnIEFuZGVyc29u
IiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiDlhpnpgZPvvJoKPj4gPkhpLAo+PiA+Cj4+ID5PbiBU
dWUsIEphbiAxNCwgMjAyNSBhdCAxOjA14oCvQU0gQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+
IHdyb3RlOgo+PiA+Pgo+PiA+Pgo+PiA+PiBIaSBBbGwsCj4+ID4+Cj4+ID4+IEF0IDIwMjUtMDEt
MTMgMTg6MTc6MzgsICJBbmR5IFlhbiIgPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+PiA+PiA+
Cj4+ID4+ID5Tb3JyeSwgcGxlYXNlIGRvbid0IG1lcmdlIHRoaXMgcGF0Y2guIGFmdGVyIGZ1cnRo
ZXIgdGVzdGluZywKPj4gPj4gPkkgZm91bmQgdGhhdCB0aGVyZSBhcmUgc3RpbGwgc29tZSBjaGFu
Z2NlLCBpdCBjYW4ndCByZWFkIGVkaWQuCj4+ID4+Cj4+ID4+IEl0IHR1cm5zIG91dCB0aGF0IHdl
IG5lZWQgc2V0IGhwZC1yZWxpYWJsZS1kZWxheS1tcyA9IDEyMCBpbiBkdHMgdG8gZW5zdXJlCj4+
ID4+IHRoZSByaWdodCB0aW1lIHRvIGFjY2VzcyBlZGlkLgo+PiA+Cj4+ID5UaGF0IHNlZW1zIGF3
ZnVsbHkgaGlnaCBhbmQgZmVlbHMgbGlrZWx5IHRvIGJlIGEgcHJvYmxlbSB3aXRoIHlvdXIKPj4g
PmJvYXJkIGRlc2lnbiBhbmQgbm90IHRoZSBwYW5lbC4gQXJlIHlvdSBzdXJlIEhQRCBpcyBldmVu
IGhvb2tlZCB1cAo+PiA+cHJvcGVybHkgb24geW91ciBib2FyZD8gTWF5YmUgeW91J3JlIG1pc3Np
bmcgYSBwdWxsdXAvcHVsbGRvd24gY29uZmlnCj4+ID5zb21ld2hlcmU/IFdvdWxkIGl0IGJlIGJl
dHRlciB0byBqdXN0IHNwZWNpZnkgIm5vLWhwZCIgYW5kIGdldCB0aGUKPj4gPmZ1bGwgIkhQRCBh
YnNlbnQiIGRlbGF5Pwo+PiA+Cj4+ID4KPj4gPj4gU28gdGhlIHBhdGNoIGlzIG9rLCBpdCBpcyBy
ZWFkeSBmb3IgcmV2aWV3Lgo+PiA+Pgo+PiA+PiA+Cj4+ID4+ID5BdCAyMDI1LTAxLTEzIDE2OjU5
OjU0LCAiQW5keSBZYW4iIDxhbmR5c2hya0AxNjMuY29tPiB3cm90ZToKPj4gPj4gPj5BZGQgYW4g
ZURQIHBhbmVsIGVudHJ5IGZvciBCT0UgTlYxNDBGSE0tTjRaLgo+PiA+PiA+Pgo+PiA+PiA+Pk5v
IGRhdGFzaGVldCBmb3VuZCBmb3IgdGhpcyBwYW5lbC4KPj4gPgo+PiA+SSBzZWVtIHRvIGJlIGFi
bGUgdG8gZmluZCBhIGRhdGFzaGVldCBmb3Igc29tZXRoaW5nIHRoYXQgY2FsbHMgaXRzZWxmCj4+
ID5OVjE0MEZITS1ONFosIGJ1dCBpdCBtaWdodCBiZSBhIGRpZmZlcmVudCBIVyB2ZXJzaW9uIHNp
bmNlIGl0IGhhcyBhCj4+ID5kaWZmZXJlbnQgSUQuIEluIG15IGRhdGFzaGVldCwgdGhvdWdoLCAi
cHJlcGFyZV90b19lbmFibGUiIHNob3VsZCBiZQo+PiA+ODAgZm9yIHRoaXMgcGFuZWwsIG5vdCAy
MDAuIFRoYXQgbWF0Y2hlcyBhbm90aGVyIG5lYXJieSBwYW5lbAo+PiA+Ik5WMTQwV1VNLU40MSIu
IEFyZSB5b3Ugc3VyZSB5b3UgbmVlZCAyMDA/Cj4+Cj4+IEkgYW0gbm90IHN1cmUgYWJvdXQgdGhh
dCB2YWx1ZSwKPj4gSSBzZWFyY2hlZCBvbiB0aGUgaW50ZXJuZXQsIGFuZCBjYW4ndCBmaW5kIGEg
ZGF0YXNoZWV0IG1hdGNoIEJPRSBOVjE0MEZITS1OWgo+PiBJIHNldCB0aGlzIHZhbHVlIGFjY29y
ZGluZzogTlYxNDBGSE0tTjQxLCBhbmQgdGhlbiBkbyBtYW55IHRlc3RzIHRvIHNlZSBpZiBpdCBo
YXMKPj4gYW55IHByb2JsZW0uCj4+Cj4+IGh0dHA6Ly93d3cudGZpbm5vLmNvbS9QSUMvUElDLzIw
MjE1MTIxNjI4NDQwLnBkZgo+Pgo+PiBbICAgIDMuMDIxNzAwXSBwYW5lbC1zaW1wbGUtZHAtYXV4
IGF1eC1mZGVkMDAwMC5lZHA6IERldGVjdGVkIEJPRSBOVjE0MEZITS1OWiAoMHgwYjA5KQo+Cj5U
aGFua3MgZm9yIHRoZSBwb2ludGVyLiBJIHdpbGwgbm90ZSB0aGF0IHRoZSBkYXRhc2hlZXQgdGhl
cmUgc2hvd3M6Cj4KPjIwMG1zIDwgVDMrVDQrVDUrVDYrVDgKPgo+VGhpcyBpcyBkaWZmZXJlbnQg
dGhhbiBJIHNhdyBpbiBteSBkYXRhc2hlZXQsIHdoaWNoIHNhaWQ6Cj4KPlQ0K1Q1K1Q2K1Q4Pjgw
bXMKPgo+U3BlY2lmaWNhbGx5LCB5b3VyIHRpbWUgaW5jbHVkZXMgVDMgYW5kIG1pbmUgZG9lc24n
dC4gVGhhdCdzCj5pbXBvcnRhbnQuIElmIHlvdSB3YW50IHRvIGFkZCBzdXBwb3J0IGJhc2VkIG9u
IHlvdXIgZGF0YXNoZWV0IHRoZW4gdGhlCj4yMDBtcyBzaG91bGQgYmUgaW4gYHBvd2VyZWRfb25f
dG9fZW5hYmxlYCwgbm90IGluIGBwcmVwYXJlX3RvX2VuYWJsZWAuCj4KPlNhaWQgYW5vdGhlciB3
YXksIHlvdSBoYXZlOgo+Cj5kZWxheV8yMDBfNTAwX2U1MF9wMmUyMDAKPgo+SWYgeW91IHdhbnQg
dGltaW5ncyBiYXNlZCBvbiB5b3VyIGRhdGFzaGVldCBvZiBhIHNpbWlsYXIgcHJvZHVjdDoKPgo+
ZGVsYXlfMjAwXzUwMF9lNTBfcG8yZTIwMAo+Cj5JZiB5b3Ugd2FudCB0aW1pbmdzIGJhc2VkIG9u
IG15IGRhdGFzaGVldCBvZiBhIHNpbWlsYXIgcHJvZHVjdDoKPgo+ZGVsYXlfMjAwXzUwMF9lNTBf
cDJlODAKPgo+SSdsbCBsZXQgeW91IHBpY2sgd2hpY2hldmVyIHlvdSBmZWVsIG1vcmUgY29tZm9y
dGFibGUgd2l0aC4KCgpWZXJ5IGFwcHJlY2lhdGUgeW91ciB0aG91Z2h0ZnVsIGd1aWRhbmNlLiBJ
IHdpbGwgc2VuZCBWMiBhZnRlciBtb3JlIHRlc3RzLgoKCj4KPi1Eb3VnCg==
