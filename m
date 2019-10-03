Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1FC99A5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612706E2B4;
	Thu,  3 Oct 2019 08:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232CD6E2B4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:19:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 01:19:21 -0700
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; d="scan'208";a="182316984"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 01:19:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Mat King <mathewk@google.com>
Subject: Re: New sysfs interface for privacy screens
In-Reply-To: <20191002094650.3fc06a85@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <20191002094650.3fc06a85@lwn.net>
Date: Thu, 03 Oct 2019 11:19:13 +0300
Message-ID: <87muei9r7i.fsf@intel.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwMiBPY3QgMjAxOSwgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4gd3Jv
dGU6Cj4gT24gVHVlLCAxIE9jdCAyMDE5IDEwOjA5OjQ2IC0wNjAwCj4gTWF0IEtpbmcgPG1hdGhl
d2tAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPj4gSSBoYXZlIGJlZW4gbG9va2luZyBpbnRvIGFkZGlu
ZyBMaW51eCBzdXBwb3J0IGZvciBlbGVjdHJvbmljIHByaXZhY3kKPj4gc2NyZWVucyB3aGljaCBp
cyBhIGZlYXR1cmUgb24gc29tZSBuZXcgbGFwdG9wcyB3aGljaCBpcyBidWlsdCBpbnRvIHRoZQo+
PiBkaXNwbGF5IGFuZCBhbGxvd3MgdXNlcnMgdG8gdHVybiBpdCBvbiBpbnN0ZWFkIG9mIG5lZWRp
bmcgdG8gdXNlIGEKPj4gcGh5c2ljYWwgcHJpdmFjeSBmaWx0ZXIuIEluIGRpc2N1c3Npb25zIHdp
dGggbXkgY29sbGVhZ3VlcyB0aGUgaWRlYSBvZgo+PiB1c2luZyBlaXRoZXIgL3N5cy9jbGFzcy9i
YWNrbGlnaHQgb3IgL3N5cy9jbGFzcy9sZWRzIGJ1dCB0aGlzIG5ldwo+PiBmZWF0dXJlIGRvZXMg
bm90IHNlZW0gdG8gcXVpdGUgZml0IGludG8gZWl0aGVyIG9mIHRob3NlIGNsYXNzZXMuCj4KPiBG
V0lXLCBpdCBzZWVtcyB0aGF0IHlvdSdyZSBub3QgYWxvbmUgaW4gdGhpczsgNS40IGdvdCBzb21l
IHN1cHBvcnQgZm9yCj4gc3VjaCBzY3JlZW5zIGlmIEkgdW5kZXJzdGFuZCB0aGluZ3MgY29ycmVj
dGx5Ogo+Cj4gICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD0xMTBlYTFkODMzYWQKCk9oLCBJIGRpZG4n
dCByZWFsaXplIGl0IGdvdCBtZXJnZWQgYWxyZWFkeSwgSSB0aG91Z2h0IHRoaXMgd2FzCnJlbGF0
ZWQuLi4KClNvIHdlJ3ZlIGFscmVhZHkgcmVwbGljYXRlZCB0aGUgYmFja2xpZ2h0IHN5c2ZzIGlu
dGVyZmFjZSBwcm9ibGVtIGZvcgpwcml2YWN5IHNjcmVlbnMuIDooCgpCUiwKSmFuaS4KCgotLSAK
SmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
