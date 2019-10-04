Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B5CC357
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 21:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71916EC18;
	Fri,  4 Oct 2019 19:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E999F6EC18
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 19:08:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 12:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,257,1566889200"; d="scan'208";a="196758338"
Received: from lpindor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.17.203])
 by orsmga006.jf.intel.com with ESMTP; 04 Oct 2019 12:08:27 -0700
Date: Fri, 4 Oct 2019 20:08:26 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Fix comment doc for format_modifiers
Message-ID: <20191004190826.x26gb5wnurmwobej@intel.com>
References: <20191002183011.GA29177@ravnborg.org>
 <20191003075118.6257-1-andrzej.p@collabora.com>
 <20191003135318.GH1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003135318.GH1208@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
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

T24gVGh1cnNkYXksIDIwMTktMTAtMDMgMTY6NTM6MTggKzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3
cm90ZToKPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAwOTo1MToxOEFNICswMjAwLCBBbmRyemVq
IFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4gPiBUbyBodW1hbiByZWFkZXJzCj4gCj4gVGhlIGNvbW1p
dCBtZXNzYWdlIGlzIGFsd2F5cyBmb3IgaHVtYW4gcmVhZGVycywgbm8gbmVlZCB0byBwb2ludCB0
aGF0Cj4gb3V0Li4uCj4gCj4gPiAKPiA+ICJhcnJheSBvZiBzdHJ1Y3QgZHJtX2Zvcm1hdCBtb2Rp
ZmllcnMiIGlzIGFsbW9zdCBpbmRpc3Rpbmd1aXNoYWJsZSBmcm9tCj4gPiAiYXJyYXkgb2Ygc3Ry
dWN0IGRybV9mb3JtYXRfbW9kaWZpZXJzIiwgZXNwZWNpYWxseSBnaXZlbiB0aGF0Cj4gPiBzdHJ1
Y3QgZHJtX2Zvcm1hdF9tb2RpZmllciBkb2VzIGV4aXN0Lgo+IAo+IC4uYnV0IHRoaXMgcGFyYWdy
YXBoIHN0aWxsIG1hbmFnZXMgdG8gMTAwJSBjb25mdXNlIHRoaXMgcGFydGljdWxhciBodW1hbi4K
ClRoZXJlJ3MgYW4gdW5kZXJzY29yZSBpbnN0ZWFkIG9mIGEgc3BhY2Ugb24gdGhlIHNlY29uZCBs
aW5lCihzL2RybV9mb3JtYXQgbW9kaWZpZXJzL2RybV9mb3JtYXRfbW9kaWZpZXJzLykuCgpJdCBz
aG91bGQgZGVmaW5pdGVseSBiZSByZXdvcmRlZCB0byBiZSBtdWNoIGNsZWFyZXIuCgo+IAo+IFRo
ZSBhY3R1YWwgY29kZSBjaGFuZ2VzIGxndG0sIHNvIHdpdGggdGhlIGNvbW1pdCBtZXNzYWdlIHJl
d29yZGVkCj4gdGhpcyBwYXRjaCBpcwo+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+ID4gCj4gPiBBbmQgaW5kZWVkIHRoZSBw
YXJhbWV0ZXIgcGFzc2VzIGFuIGFycmF5IG9mIHVpbnQ2NF90IHJhdGhlciB0aGFuIGFuIGFycmF5
Cj4gPiBvZiBzdHJ1Y3RzLCBidXQgdGhlIGZpcnN0IHdvcmRzIG9mIHRoZSBjb21tZW50IHN1Z2dl
c3QgdGhhdCBpdCBwYXNzZXMKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFz
aWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fcGxhbmUuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+ID4gaW5kZXggZDZhZDYw
YWIwZDM4Li4wZDRmOTE3MmMwZGQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+ID4gQEAgLTE2
MCw3ICsxNjAsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQo+ID4gICAqIEBmdW5jczogY2Fs
bGJhY2tzIGZvciB0aGUgbmV3IHBsYW5lCj4gPiAgICogQGZvcm1hdHM6IGFycmF5IG9mIHN1cHBv
cnRlZCBmb3JtYXRzIChEUk1fRk9STUFUXF9cKikKPiA+ICAgKiBAZm9ybWF0X2NvdW50OiBudW1i
ZXIgb2YgZWxlbWVudHMgaW4gQGZvcm1hdHMKPiA+IC0gKiBAZm9ybWF0X21vZGlmaWVyczogYXJy
YXkgb2Ygc3RydWN0IGRybV9mb3JtYXQgbW9kaWZpZXJzIHRlcm1pbmF0ZWQgYnkKPiA+ICsgKiBA
Zm9ybWF0X21vZGlmaWVyczogYXJyYXkgb2YgZm9ybWF0IG1vZGlmaWVycyB0ZXJtaW5hdGVkIGJ5
Cj4gPiAgICogICAgICAgICAgICAgICAgICAgIERSTV9GT1JNQVRfTU9EX0lOVkFMSUQKPiA+ICAg
KiBAdHlwZTogdHlwZSBvZiBwbGFuZSAob3ZlcmxheSwgcHJpbWFyeSwgY3Vyc29yKQo+ID4gICAq
IEBuYW1lOiBwcmludGYgc3R5bGUgZm9ybWF0IHN0cmluZyBmb3IgdGhlIHBsYW5lIG5hbWUsIG9y
IE5VTEwgZm9yIGRlZmF1bHQgbmFtZQo+ID4gLS0gCj4gPiAyLjE3LjEKPiA+IAo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
