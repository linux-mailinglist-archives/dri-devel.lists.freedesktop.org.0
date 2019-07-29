Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22978762
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 10:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E81B89C1C;
	Mon, 29 Jul 2019 08:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B06389C1C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 08:30:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 01:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; d="scan'208";a="190498965"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 01:30:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: OLED panel brightness support
In-Reply-To: <20190725115909.GA15868@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
 <20190724114851.GY15868@phenom.ffwll.local>
 <30f693a33f5a45ce84673fd8d7cecc7a@AUSX13MPC105.AMER.DELL.COM>
 <42946AB1-3732-467D-ABC9-C7ED3C9C4D06@canonical.com>
 <20190725115909.GA15868@phenom.ffwll.local>
Date: Mon, 29 Jul 2019 11:34:39 +0300
Message-ID: <87a7cxp7c0.fsf@intel.com>
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
Cc: anthony.wong@canonical.com, dri-devel@lists.freedesktop.org,
 Mario.Limonciello@dell.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdWwgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwMzozNTo0MFBNICswODAwLCBLYWktSGVuZyBG
ZW5nIHdyb3RlOgo+PiBUaGUgbmV4dCBxdWVzdGlvbiBpcywgaG93IGRvIHdlIGNoYW5nZSB0aGUg
YnJpZ2h0bmVzcyBsZXZlbCBmb3IgT0xFRAo+PiBkaXNwbGF5cz8gSXMgY2hhbmdpbmcgZ2FtbWEg
dmFsdWUgYSBnb29kIHdheSB0byBkbyBpdD8KPgo+IFRoZXJlJ3Mgbm8gb3ZlcmFsbCBhbXBsaWZp
ZXIga25vYiB0byBzZXQgZ2VuZXJhbCBicmlnaHRuZXNzIG9uIHRoZXNlPwoKVXN1YWxseSB0aGVy
ZSB3b3VsZCBiZS4gVGhlcmUncyBubyBiYWNrbGlnaHQsIGl0J3MganVzdCB0aGUgT0xFRApicmln
aHRuZXNzLCBzbyB5b3UnZCBuZWVkIHRvIHRhbGsgdG8gdGhlIHBhbmVsIGl0c2VsZi4gT24gZURQ
IHRoaXMgd291bGQKYmUgYWNjb21wbGlzaGVkIGJ5IHVzaW5nIERQQ0QsIG9uIGNvbW1hbmQgbW9k
ZSBEU0kgYnkgdXNpbmcgRENTCmNvbW1hbmRzLiBWRVNBIHNwZWNpZmllcyB0aGUgRFBDRCBjb21t
YW5kcyB0byB1c2UsIGFuZCB3ZSBoYXZlIHNvbWUKbGV2ZWwgb2Ygc3VwcG9ydCBmb3IgdGhhdCBp
biBpOTE1IChncmFudGVkLCBzaG91bGQgYmUgb25lIGxldmVsIGhpZ2hlcgppbiBkcm0gY29yZSwg
YnV0IEkgZGlncmVzcykuCgpJdCdzIGp1c3QgdGhhdCBhdCBsZWFzdCBpbiB0aGUgY2FzZSBvZiB0
aGUgcmVmZXJlbmNlZCBidWcsIGl0IGRvZXNuJ3QKc2VlbSB0byB1c2UgdGhlIHN0YW5kYXJkIERQ
Q0QgY29tbWFuZHMuIFRvIHN1cHBvcnQgdGhhdCwgc29tZW9uZSB3b3VsZApoYXZlIHRvIGFjcXVp
cmUgdGhlIHBhbmVsIHNwZWNzIG9yIHJldmVyc2UgZW5naW5lZXIgdGhlIHByb3ByaWV0YXJ5CnN0
dWZmLiBBbmQgdGhlbiB5b3UnZCBoYXZlIHRvIG1lc3MgdGhlIGRyaXZlciB0byBkbyB0aGluZ3Mg
ZGlmZmVyZW50bHkKdG8gY2F0ZXIgZm9yIGluZGl2aWR1YWwgcHJvcHJpZXRhcnkgcGFuZWxzLgoK
QlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
