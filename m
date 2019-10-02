Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64376C4AAB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 11:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158FB89E05;
	Wed,  2 Oct 2019 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB7589E05
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 09:30:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 02:30:14 -0700
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; d="scan'208";a="181985963"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 02:30:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mat King <mathewk@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: New sysfs interface for privacy screens
In-Reply-To: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
Date: Wed, 02 Oct 2019 12:30:05 +0300
Message-ID: <87h84rbile.fsf@intel.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, rafael@kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Ross Zwisler <zwisler@google.com>,
 gregkh@linuxfoundation.org, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwMSBPY3QgMjAxOSwgTWF0IEtpbmcgPG1hdGhld2tAZ29vZ2xlLmNvbT4gd3JvdGU6
Cj4gUmVzZW5kaW5nIGluIHBsYWluIHRleHQgbW9kZQo+Cj4gSSBoYXZlIGJlZW4gbG9va2luZyBp
bnRvIGFkZGluZyBMaW51eCBzdXBwb3J0IGZvciBlbGVjdHJvbmljIHByaXZhY3kKPiBzY3JlZW5z
IHdoaWNoIGlzIGEgZmVhdHVyZSBvbiBzb21lIG5ldyBsYXB0b3BzIHdoaWNoIGlzIGJ1aWx0IGlu
dG8gdGhlCj4gZGlzcGxheSBhbmQgYWxsb3dzIHVzZXJzIHRvIHR1cm4gaXQgb24gaW5zdGVhZCBv
ZiBuZWVkaW5nIHRvIHVzZSBhCj4gcGh5c2ljYWwgcHJpdmFjeSBmaWx0ZXIuIEluIGRpc2N1c3Np
b25zIHdpdGggbXkgY29sbGVhZ3VlcyB0aGUgaWRlYSBvZgo+IHVzaW5nIGVpdGhlciAvc3lzL2Ns
YXNzL2JhY2tsaWdodCBvciAvc3lzL2NsYXNzL2xlZHMgYnV0IHRoaXMgbmV3Cj4gZmVhdHVyZSBk
b2VzIG5vdCBzZWVtIHRvIHF1aXRlIGZpdCBpbnRvIGVpdGhlciBvZiB0aG9zZSBjbGFzc2VzLgo+
Cj4gSSBhbSBwcm9wb3NpbmcgYWRkaW5nIGEgY2xhc3MgY2FsbGVkICJwcml2YWN5X3NjcmVlbiIg
dG8gaW50ZXJmYWNlCj4gd2l0aCB0aGVzZSBkZXZpY2VzLiBUaGUgaW5pdGlhbCBBUEkgd291bGQg
YmUgc2ltcGxlIGp1c3QgYSBzaW5nbGUKPiBwcm9wZXJ0eSBjYWxsZWQgInByaXZhY3lfc3RhdGUi
IHdoaWNoIHdoZW4gc2V0IHRvIDEgd291bGQgbWVhbiB0aGF0Cj4gcHJpdmFjeSBpcyBlbmFibGVk
IGFuZCAwIHdoZW4gcHJpdmFjeSBpcyBkaXNhYmxlZC4KPgo+IEN1cnJlbnQga25vd24gdXNlIGNh
c2VzIHdpbGwgdXNlIEFDUEkgX0RTTSBpbiBvcmRlciB0byBpbnRlcmZhY2Ugd2l0aAo+IHRoZSBw
cml2YWN5IHNjcmVlbnMsIGJ1dCB0aGlzIGNsYXNzIHdvdWxkIGFsbG93IGRldmljZSBkcml2ZXIg
YXV0aG9ycwo+IHRvIHVzZSBvdGhlciBpbnRlcmZhY2VzIGFzIHdlbGwuCj4KPiBFeGFtcGxlOgo+
Cj4gIyBnZXQgcHJpdmFjeSBzY3JlZW4gc3RhdGUKPiBjYXQgL3N5cy9jbGFzcy9wcml2YWN5X3Nj
cmVlbi9jcm9zX3ByaXZhY3kvcHJpdmFjeV9zdGF0ZSAjIDE6IHByaXZhY3kKPiBlbmFibGVkIDA6
IHByaXZhY3kgZGlzYWJsZWQKPgo+ICMgc2V0IHByaXZhY3kgZW5hYmxlZAo+IGVjaG8gMSA+IC9z
eXMvY2xhc3MvcHJpdmFjeV9zY3JlZW4vY3Jvc19wcml2YWN5L3ByaXZhY3lfc3RhdGUKPgo+ICBE
b2VzIHRoaXMgYXBwcm9hY2ggc2VlbSB0byBiZSByZWFzb25hYmxlPwoKV2hhdCBwYXJ0IG9mIHRo
ZSB1c2Vyc3BhY2Ugd291bGQgYmUgbWFuYWdpbmcgdGhlIHByaXZhY3kgc2NyZWVuPyBTaG91bGQK
dGhlcmUgYmUgYSBjb25uZWN0aW9uIGJldHdlZW4gdGhlIGRpc3BsYXkgYW5kIHRoZSBwcml2YWN5
IHNjcmVlbiB0aGF0CmNvdmVycyB0aGUgZGlzcGxheT8gSG93IHdvdWxkIHRoZSB1c2Vyc3BhY2Ug
bWFrZSB0aGF0IGNvbm5lY3Rpb24gaWYgaXQncwphIHN5c2ZzIGludGVyZmFjZT8KCkkgZG9uJ3Qg
a25vdyBob3cgdGhlIHByaXZhY3kgc2NyZWVuIG9wZXJhdGVzLCBidXQgaWYgaXQgZHJhd3MgYW55
IHBvd2VyLAp5b3UnbGwgd2FudCB0byBkaXNhYmxlIGl0IHdoZW4geW91IHN3aXRjaCBvZmYgdGhl
IGRpc3BsYXkgaXQgY292ZXJzLgoKSWYgdGhlIHByaXZhY3kgc2NyZWVuIGNvbnRyb2wgd2FzIHBh
cnQgb2YgdGhlIGdyYXBoaWNzIHN1YnN5c3RlbSAoc2F5LCBhCkRSTSBjb25uZWN0b3IgcHJvcGVy
dHksIHdoaWNoIGZlZWxzIHNvbWV3aGF0IG5hdHVyYWwpLCBJIHRoaW5rIGl0IHdvdWxkCm1ha2Ug
aXQgZWFzaWVyIGZvciB1c2Vyc3BhY2UgdG8gaGF2ZSBwb2xpY2llcyBzdWNoIGFzIGVuYWJsaW5n
IHRoZQpwcml2YWN5IHNjcmVlbiBhdXRvbWF0aWNhbGx5IGRlcGVuZGluZyBvbiB0aGUgY29udGVu
dCB5b3UncmUgdmlld2luZywKYnV0IG9ubHkgaWYgdGhlIGNvbnRlbnQgaXMgb24gdGhlIGRpc3Bs
YXkgdGhhdCBoYXMgYSBwcml2YWN5IHNjcmVlbi4KCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1
bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
