Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FD82FDD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 12:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0F789091;
	Tue,  6 Aug 2019 10:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE5B88894;
 Tue,  6 Aug 2019 10:44:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 03:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="192636648"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2019 03:44:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PULL] drm-misc-next
In-Reply-To: <CACvgo50-N8SqwfLtzMhsvEhY7VMiH4SyTju2mM0mVXamnKktjw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
 <CACvgo51Do4XDY9wRku-0v5B+mRRzV2+SgD=dvFT3J9TMf8RK9Q@mail.gmail.com>
 <CAKMK7uEcoQK+y6y2wW6GJzKDjtPZZ5gads3JY6xL+JiP+2QABQ@mail.gmail.com>
 <CACvgo50z6bGu4=jqEHCSUOd_geadEwuOcOquLiVRsCdRroG2fg@mail.gmail.com>
 <CAKMK7uFpuLhR6eL+C15-kPYiEO1upU0+z9nz2BOhriKtSnqX5Q@mail.gmail.com>
 <CAPj87rMj+Y6vW9VubUnHm1QUmh5JJ-+VwQRd5SULwH0rg6ZYSw@mail.gmail.com>
 <CACvgo50-N8SqwfLtzMhsvEhY7VMiH4SyTju2mM0mVXamnKktjw@mail.gmail.com>
Date: Tue, 06 Aug 2019 13:48:38 +0300
Message-ID: <87ef1yk1rt.fsf@intel.com>
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
Cc: "DRM maintainer tools announcements,
 discussion, and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNiBBdWcgMjAxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IHdyb3RlOgo+IE9uIFR1ZSwgNiBBdWcgMjAxOSBhdCAxMToxNCwgRGFuaWVsIFN0b25lIDxk
YW5pZWxAZm9vaXNoYmFyLm9yZz4gd3JvdGU6Cj4KPj4gVGhlIGlkZWEgSSBoYWQgYSBmZXcgd2Vl
a3MgYWdvIHdhcyB0byBoYXZlIGRpbSB1c2UgJ2dpdCBwdXNoCj4+IC0tcHVzaC1vcHRpb24gZmRv
LnB1c2hlZFdpdGhEaW09dGhpcy13YXMtcHVzaGVkLXdpdGgtZGltLWFuZC1ub3QtbWFudWFsbHkn
LAo+PiB0aGVuIGhhdmUgdGhlIGhvb2tzIG9uIHRoZSBzZXJ2ZXIgc2lkZSBjaGVjayBmb3IgdGhh
dCBvcHRpb24gYW5kCj4+IHJlZnVzZSBhbnkgZGlyZWN0IHB1c2hlcy4gKE9yIGF0IGxlYXN0LCBp
ZiBwZW9wbGUgYXJlIHB1c2hpbmcKPj4gZGlyZWN0bHksIHRoZXkgaGF2ZSB0byBfcmVhbGx5XyB0
cnkgdG8gYmUgZG9pbmcgaXQsIGFuZCBjYW4ndCBkbyBpdCBieQo+PiBhY2NpZGVudC4pCj4+Cj4g
TGV0IG1lIHRyeSBhbmQgd3JpdGUgYSBESU0gcGF0Y2ggZm9yIHRoYXQuCgpPb29wcywgSSB3YXMg
d29uZGVyaW5nIGhvdyB0aGlzIHdvdWxkIGFsbCB3b3JrIG91dCwgYW5kIGVuZGVkIHVwIHdyaXRp
bmcKdGhlIHBhdGNoIFsxXS4KCkJSLApKYW5pLgoKClsxXSBodHRwOi8vbWFyYy5pbmZvLz9pPTIw
MTkwODA2MTA0NjMwLjE0Njc1LTEtamFuaS5uaWt1bGFAaW50ZWwuY29tCgoKLS0gCkphbmkgTmlr
dWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
