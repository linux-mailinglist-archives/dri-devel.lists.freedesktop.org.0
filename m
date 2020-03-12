Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AEE182E19
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234F56E0E0;
	Thu, 12 Mar 2020 10:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C1246E0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 10:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 5CC7A2A6045;
 Thu, 12 Mar 2020 11:45:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ZsZBsh3MxG4m; Thu, 12 Mar 2020 11:45:58 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 591412A6042;
 Thu, 12 Mar 2020 11:45:56 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jCLLf-000xjA-EN; Thu, 12 Mar 2020 11:45:55 +0100
Subject: Re: Variable Refresh Rate & flickering screens
To: Simon Ser <contact@emersion.fr>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Harry Wentland
 <hwentlan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Scott Anderson <scott@anderso.nz>, "Anthony.Koo@amd.com"
 <Anthony.Koo@amd.com>, Martin Peres <martin.peres@free.fr>
References: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
Date: Thu, 12 Mar 2020 11:45:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xMSA5OjA5IHAubS4sIFNpbW9uIFNlciB3cm90ZToKPiBIaSBhbGwsCj4gCj4g
SSd2ZSBiZWVuIHdvcmtpbmcgb24gYWRkaW5nIFZSUiBzdXBwb3J0IHRvIFN3YXkgWzFdIChhIFdh
eWxhbmQKPiBjb21wb3NpdG9yKS4gVGhlIGNvbXBvc2l0b3IganVzdCBzZXRzIHRoZSBWUlJfRU5B
QkxFRCBwcm9wZXJ0eS4KPiAKPiBUaGlzIHdvcmtzIGZpbmUgZm9yIHNvbWUgc2NyZWVucywgYnV0
IGNhdXNlcyBmbGNpa2VyaW5nIGZvciBvdGhlcgo+IHNjcmVlbnMgYXMgZXhwZWN0ZWQgWzJdLiBG
aXhpbmcgdGhlIGZsaWNrZXJpbmcgaXMgc29tZXRoaW5nIHdlJ3ZlCj4gdGFsa2VkIGFib3V0IGxh
c3QgWERDIFszXS4gVGhlIGZsaWNrZXJpbmcgaXMgY2F1c2VkIGJ5IHBoeXNpY2FsCj4gbGltaXRh
dGlvbnMgb2YgdGhlIHNjcmVlbjogY2hhbmdpbmcgdGhlIHJlZnJlc2ggcmF0ZSB0b28gcXVpY2ts
eQo+IHJlc3VsdHMgaW4gYnJpZ2h0bmVzcyBpc3N1ZXMuCj4gCj4gVGhlIGFwcHJvYWNoIHRha2Vu
IGJ5IHhmODYtdmlkZW8tYW1kZ3B1IGlzIHRvIG9ubHkgZW5hYmxlIFZSUiBpZiBhbiBhcHAKPiBp
cyBmdWxsc2NyZWVuIGFuZCBub3QgcHJlc2VudCBpbiBhIHNwZWNpYWwgTWVzYSBibGFja2xpc3Qg
KGUuZy4gRmlyZWZveAo+IGlzIGluIHRoZSBibGFja2xpc3QgYmVjYXVzZSBpdCBkb2Vzbid0IHJl
bmRlciBhdCBhIGZpeGVkIGludGVydmFsKS4KPiAKPiBGb3IgV2F5bGFuZCwgSSdkIHByZWZlciB0
byBhdm9pZCBoYXZpbmcgYSBibGFja2xpc3QuIEknZCBsaWtlIHRvIGJlCj4gYWJsZSB0byB1c2Ug
VlJSIGluIHRoZSBnZW5lcmFsIGNhc2UgKG5vdCBqdXN0IGZvciBmdWxsc2NyZWVuIGFwcHMpLgo+
IEEgd2F5IHRvIGZpeCB0aGUgZmxpY2tlcmluZyB3b3VsZCBiZSB0byBpbXBsZW1lbnQgYSBzbGV3
IHJhdGUgYW5kIG1ha2UKPiBpdCBzbyByZWZyZXNoIHJhdGUgdmFyaWF0aW9ucyBhcmUgY2FwcGVk
IGJ5IHRoZSBzbGV3IHJhdGUuCgpPbmUgcG90ZW50aWFsIGlzc3VlIEkgc2VlIHdpdGggdGhpcyBp
cyB0aGUgY3Vyc29yLCB3aGljaCBjYW4gZmVlbAphd2t3YXJkIGlmIGl0IG9ubHkgbW92ZXMgYXQg
MzAgSHouIEkgd29uZGVyIGlmIGEgc2xldyByYXRlIHdoaWNoIGNhbgpyZWxpYWJseSBwcmV2ZW50
IGZsaWNrZXJpbmcgYWxsb3dzIHRoZSBmcmFtZXJhdGUgdG8gcmFtcCB1cCBxdWlja2x5CmVub3Vn
aCBmb3IgdGhpcyBub3QgdG8gYmUgYW5ub3lpbmcuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOk
bnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGli
cmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5k
IFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
