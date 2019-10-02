Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B519FC8E2F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0A56E879;
	Wed,  2 Oct 2019 16:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785206E879
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:22:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 33D1C28F693
Subject: Re: [PATCH] drm: Fix comment doc for format_modifiers
To: dri-devel@lists.freedesktop.org
References: <20191002154349.26895-1-andrzej.p@collabora.com>
 <20191002161822.GA1208@intel.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <51583e96-6a2c-b945-5bc8-ff0dd5e33e4e@collabora.com>
Date: Wed, 2 Oct 2019 18:22:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002161822.GA1208@intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpXIGRuaXUgMDIuMTAuMjAxOSBvwqAxODoxOCwgVmlsbGUgU3lyasOkbMOkIHBp
c3plOgo+IE9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA1OjQzOjQ5UE0gKzAyMDAsIEFuZHJ6ZWog
UGlldHJhc2lld2ljeiB3cm90ZToKPj4gVG8gaHVtYW4gcmVhZGVycwo+Pgo+PiAiYXJyYXkgb2Yg
c3RydWN0IGRybV9mb3JtYXQgbW9kaWZpZXJzIiBpcyBhbG1vc3QgaW5kaXN0aW5ndWlzaGFibGUg
ZnJvbQo+PiAiYXJyYXkgb2Ygc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXJzIiwKPiAKPiBVbmxl
c3MgSSdtIGJsaW5kIHRob3NlIHR3byAqYXJlKiBpbmRpc3Rpbmd1aXNoYWJsZSA6UAo+IAo+PiBl
c3BlY2lhbGx5IGdpdmVuIHRoYXQKPj4gc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIgZG9lcyBl
eGlzdC4KPj4KPj4gQW5kIGluZGVlZCB0aGUgcGFyYW1ldGVyIHBhc3NlcyBhbiBhcnJheSBvZiB1
aW50NjRfdCByYXRoZXIgdGhhbiBhbiBhcnJheQo+PiBvZiBzdHJ1Y3RzLCBidXQgdGhlIGZpcnN0
IHdvcmRzIG9mIHRoZSBjb21tZW50IHN1Z2dlc3QgdGhhdCBpdCBwYXNzZXMKPj4gYW4gYXJyYXkg
b2Ygc3RydWN0cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxh
bmRyemVqLnBAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9w
bGFuZS5jIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCj4+IGluZGV4IGQ2YWQ2MGFiMGQzOC4uZGYwNWQ4
YTBkZDYzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCj4+IEBAIC0xNjAsNyArMTYwLDcgQEAgc3Rh
dGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUKPiAKPiBMb29rcyBsaWtlIHlvdSBoYXZlIGEgYnJva2VuIHZl
cnNpb24gb2YgZ2l0Lgo+IAo+PiAgICAqIEBmdW5jczogY2FsbGJhY2tzIGZvciB0aGUgbmV3IHBs
YW5lCj4+ICAgICogQGZvcm1hdHM6IGFycmF5IG9mIHN1cHBvcnRlZCBmb3JtYXRzIChEUk1fRk9S
TUFUXF9cKikKPj4gICAgKiBAZm9ybWF0X2NvdW50OiBudW1iZXIgb2YgZWxlbWVudHMgaW4gQGZv
cm1hdHMKPj4gLSAqIEBmb3JtYXRfbW9kaWZpZXJzOiBhcnJheSBvZiBzdHJ1Y3QgZHJtX2Zvcm1h
dCBtb2RpZmllcnMgdGVybWluYXRlZCBieQo+PiArICogQGZvcm1hdF9tb2RpZmllcnM6IGFycmF5
IG9mIG1vZGlmaWVycyBvZiBzdHJ1Y3QgZHJtX2Zvcm1hdCB0ZXJtaW5hdGVkIGJ5Cj4gCj4gTm93
IGl0IHNlZW1zIHRvIGJlIHNheWluZyBpdCdzIHBhc3NpbmcgaW4gc3RydWN0IGRybV9mb3JtYXQg
Zm9vW10uCj4gVGhhdCBkb2Vzbid0IHNlZW0gcmlnaHQgZWl0aGVyLgoKR29vZCBwb2ludCEKCmFy
cmF5IG9mIG1vZGlmaWVycyBhcHBsaWVkIHRvIHN0cnVjdCBkcm1fZm9ybWF0PwoKQW5kcnplagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
