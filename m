Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5C85BDC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A136E7A2;
	Thu,  8 Aug 2019 07:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A5176E72D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 15:32:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7905344;
 Wed,  7 Aug 2019 08:32:54 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C9A53F706;
 Wed,  7 Aug 2019 08:32:53 -0700 (PDT)
Subject: Re: drm pull for v5.3-rc1
To: Matthew Wilcox <willy@infradead.org>
References: <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
 <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
 <CAHk-=wghASUU7QmoibQK7XS09na7rDRrjSrWPwkGz=qLnGp_Xw@mail.gmail.com>
 <20190806073831.GA26668@infradead.org>
 <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
 <20190806190937.GD30179@bombadil.infradead.org>
 <20190807064000.GC6002@infradead.org>
 <20190807141517.GA5482@bombadil.infradead.org>
 <62cbe523-e8a4-cdfd-90c2-80260cefa5de@arm.com>
 <20190807145601.GB5482@bombadil.infradead.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <4b9ea419-571b-93ab-ee52-811e52c0ae91@arm.com>
Date: Wed, 7 Aug 2019 16:32:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807145601.GB5482@bombadil.infradead.org>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas@shipmail.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDgvMjAxOSAxNTo1NiwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gV2VkLCBBdWcg
MDcsIDIwMTkgYXQgMDM6MzA6MzhQTSArMDEwMCwgU3RldmVuIFByaWNlIHdyb3RlOgo+PiBPbiAw
Ny8wOC8yMDE5IDE1OjE1LCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPj4+IE9uIFR1ZSwgQXVnIDA2
LCAyMDE5IGF0IDExOjQwOjAwUE0gLTA3MDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4+
IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDEyOjA5OjM4UE0gLTA3MDAsIE1hdHRoZXcgV2lsY294
IHdyb3RlOgo+Pj4+PiBIYXMgYW55b25lIGxvb2tlZCBhdCB0dXJuaW5nIHRoZSBpbnRlcmZhY2Ug
aW5zaWRlLW91dD8gIGllIHNvbWV0aGluZyBsaWtlOgo+Pj4+Pgo+Pj4+PiAJc3RydWN0IG1tX3dh
bGtfc3RhdGUgc3RhdGUgPSB7IC5tbSA9IG1tLCAuc3RhcnQgPSBzdGFydCwgLmVuZCA9IGVuZCwg
fTsKPj4+Pj4KPj4+Pj4gCWZvcl9lYWNoX3BhZ2VfcmFuZ2UoJnN0YXRlLCBwYWdlKSB7Cj4+Pj4+
IAkJLi4uIGRvIHNvbWV0aGluZyB3aXRoIHBhZ2UgLi4uCj4+Pj4+IAl9Cj4+Pj4+Cj4+Pj4+IHdp
dGggYXBwcm9wcmlhdGUgbWFjcm9sb2d5IGFsb25nIHRoZSBsaW5lcyBvZjoKPj4+Pj4KPj4+Pj4g
I2RlZmluZSBmb3JfZWFjaF9wYWdlX3JhbmdlKHN0YXRlLCBwYWdlKQkJCQlcCj4+Pj4+IAl3aGls
ZSAoKHBhZ2UgPSBwYWdlX3JhbmdlX3dhbGtfbmV4dChzdGF0ZSkpKQo+Pj4+Pgo+Pj4+PiBUaGVu
IHlvdSBkb24ndCBuZWVkIHRvIHBhY2thZ2UgYW55dGhpbmcgdXAgaW50byBzdHJ1Y3RzIHRoYXQg
YXJlIHNoYXJlZAo+Pj4+PiBiZXR3ZWVuIHRoZSBjYWxsZXIgYW5kIHRoZSBpdGVyYXRlZCBmdW5j
dGlvbi4KPj4+Pgo+Pj4+IEknbSBub3QgYW4gYWxsIHRoYXQgaHVnZSBmYW4gb2Ygc3VwZXIgbWFn
aWMgbWFjcm8gbG9vcHMuICBCdXQgaW4gdGhpcwo+Pj4+IGNhc2UgSSBkb24ndCBzZWUgaG93IGl0
IGNvdWxkIGV2ZW4gd29yaywgYXMgd2UgZ2V0IHNwZWNpYWwgY2FsbGJhY2tzCj4+Pj4gZm9yIGh1
Z2UgcGFnZXMgYW5kIGhvbGVzLCBhbmQgcGVvcGxlIGFyZSB0cnlpbmcgdG8gYWRkIGEgZmV3IG1v
cmUgb3BzCj4+Pj4gYXMgd2VsbC4KPj4+Cj4+PiBXZSBjb3VsZCBoYXZlIGJpdHMgaW4gdGhlIG1t
X3dhbGtfc3RhdGUgd2hpY2ggaW5kaWNhdGUgd2hhdCB0aGluZ3MgdG8gcmV0dXJuCj4+PiBhbmQg
d2hhdCB0aGluZ3MgdG8gc2tpcC4gIFdlIGNvdWxkIChhbmQgcHJvYmFibHkgc2hvdWxkKSBhbHNv
IHVzZSBkaWZmZXJlbnQKPj4+IGl0ZXJhdG9yIG5hbWVzIGlmIHBlb3BsZSBhY3R1YWxseSB3YW50
IHRvIGl0ZXJhdGUgZGlmZmVyZW50IHRoaW5ncy4gIGVnCj4+PiBmb3JfZWFjaF9wdGVfcmFuZ2Uo
JnN0YXRlLCBwdGUpIGFzIHdlbGwgYXMgZm9yX2VhY2hfcGFnZV9yYW5nZSgpLgo+Pj4KPj4KPj4g
VGhlIGl0ZXJhdG9yIGFwcHJvYWNoIGNvdWxkIGJlIGF3a3dhcmQgZm9yIHRoZSBsaWtlcyBvZiBt
eSBnZW5lcmljCj4+IHB0ZHVtcCBpbXBsZW1lbnRhdGlvblsxXS4gSXQgd291bGQgcmVxdWlyZSBh
biBpdGVyYXRvciB3aGljaCByZXR1cm5zIGFsbAo+PiBsZXZlbHMgYW5kIGFsbG93cyBza2lwcGlu
ZyBsZXZlbHMgd2hlbiByZXF1aXJlZCAodG8gcHJldmVudCBLQVNBTgo+PiBzbG93aW5nIHRoaW5n
cyBkb3duIHRvbyBtdWNoKS4gU28gc29tZXRoaW5nIGxpa2U6Cj4+Cj4+IHN0YXJ0X3dhbGtfcmFu
Z2UoJnN0YXRlKTsKPj4gZm9yX2VhY2hfcGFnZV9yYW5nZSgmc3RhdGUsIHBhZ2UpIHsKPj4gCXN3
aXRjaChwYWdlLT5sZXZlbCkgewo+PiAJY2FzZSBQVEU6Cj4+IAkJLi4uCj4+IAljYXNlIFBNRDoK
Pj4gCQlpZiAoLi4uKQo+PiAJCQlza2lwX3BtZCgmc3RhdGUpOwo+PiAJCS4uLgo+PiAJY2FzZSBI
T0xFOgo+PiAJCS4uLi4KPj4gCS4uLgo+PiAJfQo+PiB9Cj4+IGVuZF93YWxrX3JhbmdlKCZzdGF0
ZSk7Cj4+Cj4+IEl0IHNlZW1zIGEgbGl0dGxlIGZyYWdpbGUgLSBlLmcuIHdlIHdvdWxkbid0IChl
YXNpbHkpIGdldCB0eXBlIGNoZWNraW5nCj4+IHRoYXQgeW91IGFyZSBhY3R1YWxseSB0cmVhdGlu
ZyBhIFBURSBhcyBhIHB0ZV90LiBUaGUgc3RhdGUgbXV0YXRvcnMgbGlrZQo+PiBza2lwX3BtZCgp
IGFsc28gc2VlbSBhIGJpdCBjbHVtc3kuCj4gCj4gT25jZSB5b3UncmUgb24tYm9hcmQgd2l0aCB1
c2luZyBhIHN0YXRlIHN0cnVjdHVyZSwgeW91IGNhbiB1c2UgaXQgaW4gYWxsCj4ga2luZHMgb2Yg
ZnVuIHdheXMuICBGb3IgZXhhbXBsZToKPiAKPiBzdHJ1Y3QgbW1fd2Fsa19zdGF0ZSB7Cj4gCXN0
cnVjdCBtbV9zdHJ1Y3QgKm1tOwo+IAl1bnNpZ25lZCBsb25nIHN0YXJ0Owo+IAl1bnNpZ25lZCBs
b25nIGVuZDsKPiAJdW5zaWduZWQgbG9uZyBjdXJyOwo+IAlwNGRfdCBwNGQ7Cj4gCXB1ZF90IHB1
ZDsKPiAJcG1kX3QgcG1kOwo+IAlwdGVfdCBwdGU7Cj4gCWVudW0gcGFnZV9lbnRyeV9zaXplIHNp
emU7Cj4gCWludCBmbGFnczsKPiB9Owo+IAo+IEZvciB0aGlzIHVzZXIsIEknZCBleHBlY3Qgc29t
ZXRoaW5nIGxpa2UgLi4uCj4gCj4gCURFQ0xBUkVfTU1fV0FMS19GTEFHUyhzdGF0ZSwgbW0sIHN0
YXJ0LCBlbmQsCj4gCQkJCU1NX1dBTEtfSE9MRVMgfCBNTV9XQUxLX0FMTF9TSVpFUyk7Cj4gCj4g
CXdhbGtfZWFjaF9wdGUoc3RhdGUpIHsKPiAJCXN3aXRjaCAoc3RhdGUtPnNpemUpIHsKPiAJCWNh
c2UgUEVfU0laRV9QVEU6Cj4gCQkJLi4uIAo+IAkJY2FzZSBQRV9TSVpFX1BNRDoKPiAJCQlpZiAo
Li4uKHN0YXRlLT5wbWQpKQo+IAkJCQljb250aW51ZTsKCllvdSBuZWVkIHRvIGJlIGFibGUgdG8g
c2lnbmFsIHdoZXRoZXIgeW91IHdhbnQgdG8gZGVzY2VuZCBpbnRvIHRoZSBQTUQKb3Igc2tpcCB0
aGUgZW50aXJlIHBhcnQgb2YgdGhlIHRyZWUuIFRoaXMgd2FzIG15IHNraXBfcG1kKCkgZnVuY3Rp
b24gYWJvdmUuCgo+IAkJLi4uCj4gCQl9Cj4gCX0KPiAKPiBUaGVyZSdzIG5vIG5lZWQgdG8gaGF2
ZSBzdGFydCAvIGVuZCB3YWxrIGZ1bmN0aW9uIGNhbGxzLgo+IAoKWW91J3ZlIGdvdCBhIHN0YXJ0
IHdhbGsgZnVuY3Rpb24gKGl0J3MgeW91ciBERUNMQVJFX01NX1dBTEtfRkxBR1MKYWJvdmUpLiBU
aGUgZW5kIHdhbGsgSSBhZ3JlZSBJIHRoaW5rIHlvdSBkb24ndCBhY3R1YWxseSBuZWVkIGl0IHNp
bmNlCnN0cnVjdCBtbV93YWxrX3N0YXRlIGNvbnRhaW5zIGFsbCB0aGUgc3RhdGUuCgpTdGV2ZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
