Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB0A11F0C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 11:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26FD10E5A5;
	Wed, 15 Jan 2025 10:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="JxIcmMVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4B2610E5AF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=N1awunrREe1iTsyR+k/Vz7XeHYRk6gO7XqsAuqS2c3U=; b=J
 xIcmMVrU2S0qs67dxfllFhU2Acdy5rV1dXyyyOWZ0+xsf8u4BRSAVd7xK8AVeJ0V
 72JIxhY0IKvdVGtny34i2+xEVbqQLEz+o++jZnVtakYEI6NY+piP5Uup7cbZV1of
 hj7tpFe8AjxzzgkMnuNScavmLJkIp6DCA4xJWypsYE=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Wed, 15 Jan 2025 18:15:00 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 15 Jan 2025 18:15:00 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:Re: Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
 <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
X-NTES-SC: AL_Qu2YBPWYuUkr5ieYbOlS/DNQ2YpmHKvs4olgqcQkZd0qqTHPyz4QZ0BuLUbI3d52CRC7nP6lkym9jxYxyozw
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <224024ea.917c.19469759369.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgDXf5mkiodnD+hXAA--.34987W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQXVXmeHhRd8SAACsj
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

CkhpIERvdWcsCgrlnKggMjAyNS0wMS0xNSAwMDo0NDo0Me+8jCJEb3VnIEFuZGVyc29uIiA8ZGlh
bmRlcnNAY2hyb21pdW0ub3JnPiDlhpnpgZPvvJoKPkhpLAo+Cj5PbiBUdWUsIEphbiAxNCwgMjAy
NSBhdCAxOjA14oCvQU0gQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+Pgo+Pgo+
PiBIaSBBbGwsCj4+Cj4+IEF0IDIwMjUtMDEtMTMgMTg6MTc6MzgsICJBbmR5IFlhbiIgPGFuZHlz
aHJrQDE2My5jb20+IHdyb3RlOgo+PiA+Cj4+ID5Tb3JyeSwgcGxlYXNlIGRvbid0IG1lcmdlIHRo
aXMgcGF0Y2guIGFmdGVyIGZ1cnRoZXIgdGVzdGluZywKPj4gPkkgZm91bmQgdGhhdCB0aGVyZSBh
cmUgc3RpbGwgc29tZSBjaGFuZ2NlLCBpdCBjYW4ndCByZWFkIGVkaWQuCj4+Cj4+IEl0IHR1cm5z
IG91dCB0aGF0IHdlIG5lZWQgc2V0IGhwZC1yZWxpYWJsZS1kZWxheS1tcyA9IDEyMCBpbiBkdHMg
dG8gZW5zdXJlCj4+IHRoZSByaWdodCB0aW1lIHRvIGFjY2VzcyBlZGlkLgo+Cj5UaGF0IHNlZW1z
IGF3ZnVsbHkgaGlnaCBhbmQgZmVlbHMgbGlrZWx5IHRvIGJlIGEgcHJvYmxlbSB3aXRoIHlvdXIK
PmJvYXJkIGRlc2lnbiBhbmQgbm90IHRoZSBwYW5lbC4gQXJlIHlvdSBzdXJlIEhQRCBpcyBldmVu
IGhvb2tlZCB1cAo+cHJvcGVybHkgb24geW91ciBib2FyZD8gTWF5YmUgeW91J3JlIG1pc3Npbmcg
YSBwdWxsdXAvcHVsbGRvd24gY29uZmlnCj5zb21ld2hlcmU/IFdvdWxkIGl0IGJlIGJldHRlciB0
byBqdXN0IHNwZWNpZnkgIm5vLWhwZCIgYW5kIGdldCB0aGUKPmZ1bGwgIkhQRCBhYnNlbnQiIGRl
bGF5Pwo+Cj4KPj4gU28gdGhlIHBhdGNoIGlzIG9rLCBpdCBpcyByZWFkeSBmb3IgcmV2aWV3Lgo+
Pgo+PiA+Cj4+ID5BdCAyMDI1LTAxLTEzIDE2OjU5OjU0LCAiQW5keSBZYW4iIDxhbmR5c2hya0Ax
NjMuY29tPiB3cm90ZToKPj4gPj5BZGQgYW4gZURQIHBhbmVsIGVudHJ5IGZvciBCT0UgTlYxNDBG
SE0tTjRaLgo+PiA+Pgo+PiA+Pk5vIGRhdGFzaGVldCBmb3VuZCBmb3IgdGhpcyBwYW5lbC4KPgo+
SSBzZWVtIHRvIGJlIGFibGUgdG8gZmluZCBhIGRhdGFzaGVldCBmb3Igc29tZXRoaW5nIHRoYXQg
Y2FsbHMgaXRzZWxmCj5OVjE0MEZITS1ONFosIGJ1dCBpdCBtaWdodCBiZSBhIGRpZmZlcmVudCBI
VyB2ZXJzaW9uIHNpbmNlIGl0IGhhcyBhCj5kaWZmZXJlbnQgSUQuIEluIG15IGRhdGFzaGVldCwg
dGhvdWdoLCAicHJlcGFyZV90b19lbmFibGUiIHNob3VsZCBiZQo+ODAgZm9yIHRoaXMgcGFuZWws
IG5vdCAyMDAuIFRoYXQgbWF0Y2hlcyBhbm90aGVyIG5lYXJieSBwYW5lbAo+Ik5WMTQwV1VNLU40
MSIuIEFyZSB5b3Ugc3VyZSB5b3UgbmVlZCAyMDA/CgpJIGFtIG5vdCBzdXJlIGFib3V0IHRoYXQg
dmFsdWUsIApJIHNlYXJjaGVkIG9uIHRoZSBpbnRlcm5ldCwgYW5kIGNhbid0IGZpbmQgYSBkYXRh
c2hlZXQgbWF0Y2ggQk9FIE5WMTQwRkhNLU5aCkkgc2V0IHRoaXMgdmFsdWUgYWNjb3JkaW5nOiBO
VjE0MEZITS1ONDEsIGFuZCB0aGVuIGRvIG1hbnkgdGVzdHMgdG8gc2VlIGlmIGl0IGhhcwphbnkg
cHJvYmxlbS4KCmh0dHA6Ly93d3cudGZpbm5vLmNvbS9QSUMvUElDLzIwMjE1MTIxNjI4NDQwLnBk
ZgoKWyAgICAzLjAyMTcwMF0gcGFuZWwtc2ltcGxlLWRwLWF1eCBhdXgtZmRlZDAwMDAuZWRwOiBE
ZXRlY3RlZCBCT0UgTlYxNDBGSE0tTlogKDB4MGIwOSkKCgoKPgo+Cj4+ID4+ZWRpZDoKPj4gPj4w
MCBmZiBmZiBmZiBmZiBmZiBmZiAwMCAwOSBlNSAwOSAwYiAwMCAwMCAwMCAwMAo+PiA+PjAxIDIw
IDAxIDA0IGE1IDFmIDExIDc4IDAzIDliIDc1IDk5IDViIDVkIDhmIDJhCj4+ID4+MjMgNTAgNTQg
MDAgMDAgMDAgMDEgMDEgMDEgMDEgMDEgMDEgMDEgMDEgMDEgMDEKPj4gPj4wMSAwMSAwMSAwMSAw
MSAwMSBjOCAzNyA4MCBjYyA3MCAzOCAyOCA0MCA2YyAzMAo+PiA+PmFhIDAwIDM1IGFlIDEwIDAw
IDAwIDFhIDAwIDAwIDAwIGZkIDAwIDMwIDNjIDQzCj4+ID4+NDMgOGYgMDEgMGEgMjAgMjAgMjAg
MjAgMjAgMjAgMDAgMDAgMDAgZmUgMDAgNDIKPj4gPj40ZiA0NSAyMCA0OCA0NiAwYSAyMCAyMCAy
MCAyMCAyMCAyMCAwMCAwMCAwMCBmZQo+PiA+PjAwIDRlIDU2IDMxIDM0IDMwIDQ2IDQ4IDRkIDJk
IDRlIDM0IDVhIDBhIDAwIDM1Cj4+ID4+Cj4+ID4+U2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFu
ZHlzaHJrQDE2My5jb20+Cj4+ID4+LS0tCj4+ID4+Cj4+ID4+IGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1lZHAuYyB8IDEgKwo+PiA+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
Pgo+RldJVyBpdCdzIGdvb2QgdGhhdCBUaG9tYXMgcmVwbGllZCB0byB5b3VyIHBhdGNoLCBzaW5j
ZSB0aGF0IHdhcyB0aGUKPm9ubHkgdGhpbmcgdGhhdCBzaG93ZWQgdXAgaW4gbXkgaW5ib3guIFlv
dXIgaW5pdGlhbCBwYXRjaCBzaG93ZWQgdXAgYXMKPnNwYW0gZm9yIG1lLiA6KCBOb3Qgc3VyZSB3
aHksIHRob3VnaC4uLgo+Cj4KPj4gPj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWVkcC5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jCj4+ID4+aW5k
ZXggOTRhNDYyNDFkZWNlLi5hMzQwMmI3NmFhM2UgMTAwNjQ0Cj4+ID4+LS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jCj4+ID4+KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWVkcC5jCj4+ID4+QEAgLTE5MDksNiArMTkwOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZWRwX3BhbmVsX2VudHJ5IGVkcF9wYW5lbHNbXSA9IHsKPj4gPj4gICAgICBFRFBfUEFORUxf
RU5UUlkoJ0InLCAnTycsICdFJywgMHgwYWM1LCAmZGVsYXlfMjAwXzUwMF9lNTAsICJOVjExNldI
TS1ONEMiKSwKPj4gPj4gICAgICBFRFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdFJywgMHgwYWU4
LCAmZGVsYXlfMjAwXzUwMF9lNTBfcDJlODAsICJOVjE0MFdVTS1ONDEiKSwKPj4gPj4gICAgICBF
RFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdFJywgMHgwYjM0LCAmZGVsYXlfMjAwXzUwMF9lODAs
ICJOVjEyMldVTS1ONDEiKSwKPj4gPj4rICAgICBFRFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdF
JywgMHgwYjA5LCAmZGVsYXlfMjAwXzUwMF9lNTBfcDJlMjAwLCAiTlYxNDBGSE0tTloiKSwKPj4g
Pj4gICAgICBFRFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdFJywgMHgwYjQzLCAmZGVsYXlfMjAw
XzUwMF9lMjAwLCAiTlYxNDBGSE0tVDA5IiksCj4KPlRoaXMgaXMgbWlzLXNvcnRlZC4gMHhiMDkg
c2hvdWxkIGJlIF9iZWZvcmVfIDB4MGIzNC4gSSdsbCBvZnRlbiBmaXgKPnRoaXMgdXAgd2hlbiBh
cHBseWluZyAodGhvdWdoIGl0J3MgbW9yZSB3b3JrIGZvciBtZSksIGJ1dCBzaW5jZSBJIGhhZAo+
YSBxdWVzdGlvbiBhYm92ZSBhYm91dCBkZWxheV8yMDBfNTAwX2U1MF9wMmUyMDAgdnMuCj5kZWxh
eV8yMDBfNTAwX2U1MF9wMmU4MCBtYXliZSB5b3UgY2FuIGFuc3dlciBhbmQgYWxzbyBzZW5kIGEg
djIgd2l0aAo+dGhlIHNvcnQgb3JkZXIgZml4ZWQuCj4KPi1Eb3VnCg==
