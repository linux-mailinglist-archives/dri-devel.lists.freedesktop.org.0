Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C965B126
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908A789CD3;
	Sun, 30 Jun 2019 18:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F080B6E92C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 14:14:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 07:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="183693402"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 28 Jun 2019 07:14:56 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 28 Jun 2019 17:14:55 +0300
Date: Fri, 28 Jun 2019 17:14:55 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
Message-ID: <20190628141455.GO2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <20190628125346.GM2640@lahna.fi.intel.com>
 <c5545128e27cbcce5888f9972ff066fb4979fd28.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5545128e27cbcce5888f9972ff066fb4979fd28.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDM6MzM6NTZQTSArMDIwMCwgVGltdXIgS3Jpc3TDs2Yg
d3JvdGU6Cj4gSSBoYXZlIHR3byBtb3JlIHF1ZXN0aW9uczoKPiAKPiAxLiBXaGF0IGlzIHRoZSBi
ZXN0IHdheSB0byB0ZXN0IHRoYXQgdGhlIHZpcnR1YWwgbGluayBpcyBpbmRlZWQgY2FwYWJsZQo+
IG9mIDQwIEdiaXQgLyBzZWM/IFNvIGZhciBJJ3ZlIGJlZW4gdW5hYmxlIHRvIGZpZ3VyZSBvdXQg
aG93IHRvIG1lYXN1cmUKPiBpdHMgbWF4aW11bSB0aHJvdWdocHV0LgoKSSBkb24ndCB0aGluayB0
aGVyZSBpcyBhbnkgZ29vZCB3YXkgdG8gdGVzdCBpdCBidXQgdGhlIFRodW5kZXJib2x0IGdlbiAz
CmxpbmsgaXMgcHJldHR5IG11Y2ggYWx3YXlzIDQwIEdiL3MgKDIwIEdiL3MgeCAyKSBmcm9tIHdo
aWNoIHRoZQpiYW5kd2lkdGggaXMgc2hhcmVkIGR5bmFtaWNhbGx5IGJldHdlZW4gZGlmZmVyZW50
IHR1bm5lbHMgKHZpcnR1YWwgbGlua3MpLgoKPiAyLiBXaHkgaXMgaXQgdGhhdCB0aGUgZ2FtZSBj
YW4gb25seSB1dGlsaXplIGFzIG11Y2ggYXMgMi41IEdiaXQgLyBzZWMKPiB3aGVuIGl0IGdldHMg
Ym90dGxlbmVja2VkPyBUaGUgc2FtZSBwcm9ibGVtIGlzIG5vdCBwcmVzZW50IG9uIGEgZGVza3Rv
cAo+IGNvbXB1dGVyIHdpdGggYSAibm9ybWFsIiBQQ0llIHBvcnQuCgpUaGlzIGlzIG91dHNpZGUg
b2YgbXkga25vd2xlZGdlLCBzb3JyeS4gSG93IHRoYXQgZ2FtZSBldmVuIGtub3dzIGl0IGNhbgoi
dXRpbGl6ZSIgb25seSAyLjUgR2JpdC9zLiBEb2VzIGl0IGdvIG92ZXIgdGhlIG91dHB1dCBvZiAi
bHNwY2kiIGFzIHdlbGw/IDotKQoKVGhlIFBDSWUgbGlua3MgaXRzZWxmIHNob3VsZCB0byBnZXQg
eW91IHRoZSA4IEdUL3MgeCA0IGFuZCBJJ20gcXVpdGUKc3VyZSB0aGUgdW5kZXJseWluZyBUQlQg
bGluayB3b3JrcyBmaW5lIGFzIHdlbGwgc28gbXkgZ3Vlc3MgaXMgdGhhdCB0aGUKaXNzdWUgbGll
cyBzb21ld2hlcmUgZWxzZSBidXQgd2hlcmUsIEkgaGF2ZSBubyBpZGVhLgoKTWF5YmUgdGhlIHBy
b2JsZW0gaXMgaW4gdGhlIGdhbWUgaXRzZWxmPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
