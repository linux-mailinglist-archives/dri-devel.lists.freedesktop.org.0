Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E0CC389
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 21:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CFA6EC1F;
	Fri,  4 Oct 2019 19:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E186EC1F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 19:28:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 12:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,257,1566889200"; d="scan'208";a="222253171"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 04 Oct 2019 12:28:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2019 22:28:02 +0300
Date: Fri, 4 Oct 2019 22:28:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Eric Engestrom <eric.engestrom@intel.com>
Subject: Re: [PATCH] drm: Fix comment doc for format_modifiers
Message-ID: <20191004192801.GJ1208@intel.com>
References: <20191002183011.GA29177@ravnborg.org>
 <20191003075118.6257-1-andrzej.p@collabora.com>
 <20191003135318.GH1208@intel.com>
 <20191004190826.x26gb5wnurmwobej@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004190826.x26gb5wnurmwobej@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDg6MDg6MjZQTSArMDEwMCwgRXJpYyBFbmdlc3Ryb20g
d3JvdGU6Cj4gT24gVGh1cnNkYXksIDIwMTktMTAtMDMgMTY6NTM6MTggKzAzMDAsIFZpbGxlIFN5
cmrDpGzDpCB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA5OjUxOjE4QU0gKzAy
MDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+ID4gVG8gaHVtYW4gcmVhZGVycwo+
ID4gCj4gPiBUaGUgY29tbWl0IG1lc3NhZ2UgaXMgYWx3YXlzIGZvciBodW1hbiByZWFkZXJzLCBu
byBuZWVkIHRvIHBvaW50IHRoYXQKPiA+IG91dC4uLgo+ID4gCj4gPiA+IAo+ID4gPiAiYXJyYXkg
b2Ygc3RydWN0IGRybV9mb3JtYXQgbW9kaWZpZXJzIiBpcyBhbG1vc3QgaW5kaXN0aW5ndWlzaGFi
bGUgZnJvbQo+ID4gPiAiYXJyYXkgb2Ygc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXJzIiwgZXNw
ZWNpYWxseSBnaXZlbiB0aGF0Cj4gPiA+IHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyIGRvZXMg
ZXhpc3QuCj4gPiAKPiA+IC4uYnV0IHRoaXMgcGFyYWdyYXBoIHN0aWxsIG1hbmFnZXMgdG8gMTAw
JSBjb25mdXNlIHRoaXMgcGFydGljdWxhciBodW1hbi4KPiAKPiBUaGVyZSdzIGFuIHVuZGVyc2Nv
cmUgaW5zdGVhZCBvZiBhIHNwYWNlIG9uIHRoZSBzZWNvbmQgbGluZQo+IChzL2RybV9mb3JtYXQg
bW9kaWZpZXJzL2RybV9mb3JtYXRfbW9kaWZpZXJzLykuCgpPSywgc28gSSBndWVzcyBJIHJlYWxs
eSBhbSBibGluZC4KCj4gCj4gSXQgc2hvdWxkIGRlZmluaXRlbHkgYmUgcmV3b3JkZWQgdG8gYmUg
bXVjaCBjbGVhcmVyLgo+IAo+ID4gCj4gPiBUaGUgYWN0dWFsIGNvZGUgY2hhbmdlcyBsZ3RtLCBz
byB3aXRoIHRoZSBjb21taXQgbWVzc2FnZSByZXdvcmRlZAo+ID4gdGhpcyBwYXRjaCBpcwo+ID4g
UmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Cj4gPiAKPiA+ID4gCj4gPiA+IEFuZCBpbmRlZWQgdGhlIHBhcmFtZXRlciBwYXNzZXMgYW4g
YXJyYXkgb2YgdWludDY0X3QgcmF0aGVyIHRoYW4gYW4gYXJyYXkKPiA+ID4gb2Ygc3RydWN0cywg
YnV0IHRoZSBmaXJzdCB3b3JkcyBvZiB0aGUgY29tbWVudCBzdWdnZXN0IHRoYXQgaXQgcGFzc2Vz
Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6
ZWoucEBjb2xsYWJvcmEuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
cGxhbmUuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+ID4gPiBpbmRleCBkNmFkNjBh
YjBkMzguLjBkNGY5MTcyYzBkZCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wbGFuZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+ID4gPiBA
QCAtMTYwLDcgKzE2MCw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lCj4gPiA+ICAgKiBAZnVu
Y3M6IGNhbGxiYWNrcyBmb3IgdGhlIG5ldyBwbGFuZQo+ID4gPiAgICogQGZvcm1hdHM6IGFycmF5
IG9mIHN1cHBvcnRlZCBmb3JtYXRzIChEUk1fRk9STUFUXF9cKikKPiA+ID4gICAqIEBmb3JtYXRf
Y291bnQ6IG51bWJlciBvZiBlbGVtZW50cyBpbiBAZm9ybWF0cwo+ID4gPiAtICogQGZvcm1hdF9t
b2RpZmllcnM6IGFycmF5IG9mIHN0cnVjdCBkcm1fZm9ybWF0IG1vZGlmaWVycyB0ZXJtaW5hdGVk
IGJ5Cj4gPiA+ICsgKiBAZm9ybWF0X21vZGlmaWVyczogYXJyYXkgb2YgZm9ybWF0IG1vZGlmaWVy
cyB0ZXJtaW5hdGVkIGJ5Cj4gPiA+ICAgKiAgICAgICAgICAgICAgICAgICAgRFJNX0ZPUk1BVF9N
T0RfSU5WQUxJRAo+ID4gPiAgICogQHR5cGU6IHR5cGUgb2YgcGxhbmUgKG92ZXJsYXksIHByaW1h
cnksIGN1cnNvcikKPiA+ID4gICAqIEBuYW1lOiBwcmludGYgc3R5bGUgZm9ybWF0IHN0cmluZyBm
b3IgdGhlIHBsYW5lIG5hbWUsIG9yIE5VTEwgZm9yIGRlZmF1bHQgbmFtZQo+ID4gPiAtLSAKPiA+
ID4gMi4xNy4xCj4gPiA+IAo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAoKLS0gClZpbGxlIFN5cmrDpGzDpApJ
bnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
