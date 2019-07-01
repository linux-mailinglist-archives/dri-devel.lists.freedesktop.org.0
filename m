Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FE5C4AA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2591889BAB;
	Mon,  1 Jul 2019 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7832589C17
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 15:11:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jul 2019 08:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,439,1557212400"; d="scan'208";a="184268147"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 01 Jul 2019 08:10:58 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 01 Jul 2019 18:10:57 +0300
Date: Mon, 1 Jul 2019 18:10:57 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
Message-ID: <20190701151057.GY2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <CADnq5_NSCqbPkfA-7Z-tjBP8ffiw0ZvEdDxRXpZ-LioNApr8Hw@mail.gmail.com>
 <0bfd8ba5abb9288fe1f1ee1d9d7265885b8c8c94.camel@gmail.com>
 <CADnq5_NKB1F61kJ_VJEXHPPVO1o_tkuUmOuoFdw3xpmNnGG97A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NKB1F61kJ_VJEXHPPVO1o_tkuUmOuoFdw3xpmNnGG97A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMTA6NDY6MzRBTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+ID4gMi4gQXMgZmFyIGFzIEkgdW5kZXJzdG9vZCB3aGF0IE1pa2Egc2FpZCwgdGhlcmUg
aXNuJ3QgcmVhbGx5IGEgMi41IEdUL3MKPiA+IGxpbWl0YXRpb24gdGhlcmUsIHNpbmNlIHRoZSB2
aXJ0dWFsIGxpbmsgc2hvdWxkIGJlIHJ1bm5pbmcgYXQgNDAgR2Ivcwo+ID4gcmVnYXJkbGVzcyBv
ZiB0aGUgcmVwb3J0ZWQgc3BlZWQgb2YgdGhhdCBkZXZpY2UuIFdvdWxkIGl0IGJlIHBvc3NpYmxl
Cj4gPiB0byBydW4gdGhlIEFNRCBHUFUgYXQgOCBHVC9zIGluIHRoaXMgY2FzZT8KPiAKPiBJZiB0
aGVyZSBpcyByZWFsbHkgYSBmYXN0ZXIgbGluayBoZXJlIHRoZW4gd2UgbmVlZCBzb21lIHdheSB0
byBwYXNzCj4gdGhhdCBpbmZvcm1hdGlvbiB0byB0aGUgZHJpdmVycy4gIFdlIHJlbHkgb24gdGhl
IGluZm9ybWF0aW9uIGZyb20gdGhlCj4gdXBzdHJlYW0gYnJpZGdlcyBhbmQgdGhlIHBjaWUgY29y
ZSBoZWxwZXIgZnVuY3Rpb25zLgoKSSB0aGluayB5b3UgbWF5IHVzZSAicGNpX2Rldi0+aXNfdGh1
bmRlcmJvbHQiIGluIHRoZSBHUFUgZHJpdmVyIGFuZCB0aGVuCmp1c3QgdXNlIHdoYXRldmVyIHRo
ZSByZWFsIFBDSSBsaW5rIHNwZWVkICYgd2lkdGggaXMgYmV0d2VlbiB0aGUgR1BVIGFuZAp0aGUg
ZG93bnN0cmVhbSBwb3J0IGl0IGNvbm5lY3RzIHRvLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
