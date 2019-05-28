Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12182C00F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 09:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FB289BE8;
	Tue, 28 May 2019 07:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9D789BE8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 07:27:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 00:27:38 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 28 May 2019 00:27:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvine?=
 =?utf-8?Q?n?= <ilpo.jarvinen@cs.helsinki.fi>
Subject: Re: DRM/AST regression (likely 4.14 -> 4.19+),
 providing EDID manually fails
In-Reply-To: <878surn919.wl-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
 <878surn919.wl-ashutosh.dixit@intel.com>
Date: Tue, 28 May 2019 10:30:50 +0300
Message-ID: <87sgsz593p.fsf@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNyBNYXkgMjAxOSwgQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVs
LmNvbT4gd3JvdGU6Cj4gT24gU3VuLCAyNiBNYXkgMjAxOSAxMjo1MDo1MSAtMDcwMCwgSWxwbyBK
w6RydmluZW4gd3JvdGU6Cj4+Cj4+IEhpIGFsbCwKPj4KPj4gSSd2ZSBhIHdvcmtzdGF0aW9uIHdo
aWNoIGhhcyBpbnRlcm5hbCBWR0EgdGhhdCBpcyBkZXRlY3RlZCBhcyBBU1QgMjQwMCBhbmQKPj4g
d2l0aCBpdCBFRElEIGhhcyBiZWVuIGFsd2F5cyBxdWl0ZSBmbGFreSAoZXhjZXB0IGZvciBzb21l
IHRpbWUgaXQgd29ya2VkCj4+IHdpdGggNC4xNCBsb25nIGVub3VnaCB0aGF0IEkgdGhvdWdodCB0
aGUgcHJvYmxlbXMgd291bGQgYmUgcGFzdCB1bnRpbCB0aGUKPj4gcHJvYmxlbXMgcmVhcHBlYXJl
ZCBhbHNvIHdpdGggNC4xNCkuIFRodXMsIEkndmUgcHJvdmlkZWQgbWFudWFsbHkgdGhlIEVESUQK
Pj4gdGhhdCBJIGV4dHJhY3RlZCBmcm9tIHRoZSBtb25pdG9yIHVzaW5nIG90aGVyIGNvbXB1dGVy
ICh0aGUgbW9uaXRvciBpdHNlbGYKPj4gd29ya2VkIGp1c3QgZmluZSBvbiB0aGUgZWFybGllciBj
b21wdXRlciBzbyBpdCBpcyBsaWtlbHkgZmluZSkuCj4+Cj4+IEkgc2V0dXAgdGhlIG1hbnVhbCBF
RElEIHVzaW5nIGRybV9rbXNfaGVscGVyLmVkaWRfZmlybXdhcmUsIGhvd2V2ZXIsCj4+IGFmdGVy
IHVwZ3JhZGluZyB0byA0LjE5LjQ1IGl0IHN0b3BwZWQgd29ya2luZyAobm8gIkdvdCBleHRlcm5h
bCBFRElEIGJhc2UKPj4gYmxvY2siIGFwcGVhcnMgaW4gZG1lc2csIHRoZSB0ZXh0IG1vZGUgaXMg
a2VwdCBpbiB0aGUgbG93ZXIgcmVzIG1vZGUsIGFuZAo+PiBYb3JnIGxvZ3Mgbm8gbG9uZ2VyIGR1
bXBzIHRoZSBFRElEIGluZm8gbGlrZSBpdCBkaWQgd2l0aCA0LjE0KS4gU28gSSBndWVzcwo+PiB0
aGUgRURJRCBJIHByb3ZpZGVkIG1hbnVhbGx5IG9uIHRoZSBjb21tYW5kIGxpbmUgaXMgbm90IGNv
cnJlY3RseSBwdXQgaW50bwo+PiB1c2Ugd2l0aCA0LjE5KyBrZXJuZWxzLgo+Pgo+PiBUaGUgNC4x
OSBkbWVzZyBpbmRpY2F0ZWQgdGhhdCBkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13YXJlIGlzIGRl
cHJlY2F0ZWQKPj4gc28gSSBhbHNvIHRlc3RlZCB3aXRoIGRybS5lZGlkX2Zpcm13YXJlIGl0IHN1
Z2dlc3RlZCBhcyB0aGUgcmVwbGFjZW1lbnQKPj4gYnV0IHdpdGggbm8gbHVjayAoYnV0IEkgYmVs
aWV2ZSBhbHNvIHRoZSBkcm1fa21zX2hlbHBlciBvbmUgc2hvdWxkIGhhdmUKPj4gd29ya2VkIGFz
IGl0IHdhcyBvbmx5ICJkZXByZWNhdGVkIikuCj4+Cj4+IEkgYWxzbyB0cmllZCA1LjEuMiBidXQg
aXQgZGlkIG5vdCB3b3JrIGFueSBiZXR0ZXIgKGFuZCB3aXRoIGl0IGFsc28gdHJpZWQKPj4gcmVt
b3ZpbmcgYWxsIHRoZSBtYW51YWwgKi5lZGlkX2Zpcm13YXJlIGZyb20gdGhlIGNvbW1hbmQgbGlu
ZSBzbyBJIHN0aWxsCj4+IG5lZWQgdG8gcHJvdmlkZSBvbmUgbWFudWFsbHkgdG8gaGF2ZSBpdCBy
ZWxpYWJsZSB3b3JraW5nIGl0IHNlZW1zKS4KPgo+IEkgYmVsaWV2ZSB0aGVyZSBpcyBhIGJ1ZyBh
bHJlYWR5IHRyYWNraW5nIHRoaXMsIGhlcmU6Cj4KPiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Au
b3JnL3Nob3dfYnVnLmNnaT9pZD0xMDc1ODMKCklscG8sIGRvZXMgdmlkZW89VkdBLTE6ZSBjb21t
YW5kLWxpbmUgb3B0aW9uIHdvcmsgYXJvdW5kIHRoZSBwcm9ibGVtIGZvcgp5b3U/CgpCUiwKSmFu
aS4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
