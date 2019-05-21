Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7177324F8D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 15:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B29389229;
	Tue, 21 May 2019 13:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF42289229;
 Tue, 21 May 2019 13:02:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 06:02:13 -0700
X-ExtLoop1: 1
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.2.137])
 by fmsmga008.fm.intel.com with ESMTP; 21 May 2019 06:02:10 -0700
MIME-Version: 1.0
To: DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20190520221526.0e103916@canb.auug.org.au>
References: <20190520221526.0e103916@canb.auug.org.au>
Message-ID: <155844372974.15761.3182313807995451625@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: linux-next: Fixes tag needs some work in the drm-intel tree
Date: Tue, 21 May 2019 16:02:09 +0300
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTdGVwaGVuIFJvdGh3ZWxsICgyMDE5LTA1LTIwIDE1OjE1OjM4KQo+IEhpIGFsbCwK
PiAKPiBJbiBjb21taXQKPiAKPiAgIDBkOTBjY2I3MDIxMSAoImRybS9pOTE1OiBEZWxheSBzZW1h
cGhvcmUgc3VibWlzc2lvbiB1bnRpbCB0aGUgc3RhcnQgb2YgdGhlIHNpZ25hbGVyIikKPiAKPiBG
aXhlcyB0YWcKPiAKPiAgIEZpeGVzOiBlODg2MTk2NDY5NzEgKCJkcm0vaTkxNTogVXNlIEhXIHNl
bWFwaG9yZXMgZm9yIGludGVyLWVuZ2luZSBzeW5jaHJvbmkKPiAKPiBoYXMgdGhlc2UgcHJvYmxl
bShzKToKPiAKPiAgIC0gU3ViamVjdCBoYXMgbGVhZGluZyBidXQgbm8gdHJhaWxpbmcgcGFyZW50
aGVzZXMKPiAgIC0gU3ViamVjdCBoYXMgbGVhZGluZyBidXQgbm8gdHJhaWxpbmcgcXVvdGVzCj4g
Cj4gUGxlYXNlIGRvbid0IHNwbGl0IEZpeGVzIHRhZ3MgYWNyb3NzIG1vcmUgdGhhbiBvbmUgbGlu
ZS4KClRoYW5rcyBmb3IgdGhlIHJlcG9ydC4KClRoaXMgd2FzIGEgY29weSduIHBhc3RlIG1pc2hh
cCwgZGV0ZWN0ZWQgYnkgb3VyIHRvb2xpbmcgKGFuZCBmaXhlZCBieQptZSkgYXQgdGhlIHRpbWUg
b2YgY3JlYXRpbmcgYSBQUi4gVW5mb3J0dW5hdGVseSB0aGUgY2hlY2sgd2FzIG5vdCBiZWluZwpl
bmZvcmNlZCBieSB0b29saW5nIGF0IGNvbW1pdCB0aW1lLiBXZSdsbCBmaXggdGhhdC4KClJlZ2Fy
ZHMsIEpvb25hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
