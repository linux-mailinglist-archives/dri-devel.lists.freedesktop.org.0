Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8ABD774A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 15:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706E46E25B;
	Tue, 15 Oct 2019 13:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E926E25B;
 Tue, 15 Oct 2019 13:18:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 06:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="208181089"
Received: from mcretu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.150])
 by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2019 06:18:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] kernel-doc: rename the kernel-doc directive 'functions'
 to 'specific'
In-Reply-To: <20191015115439.GE32665@bombadil.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191013055359.23312-1-changbin.du@gmail.com>
 <875zkrd7nq.fsf@intel.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977CAF09@USCULXMSG01.am.sony.com>
 <7e7557b5-469f-3e63-6254-53dab2d7234a@suse.de>
 <20191015115439.GE32665@bombadil.infradead.org>
Date: Tue, 15 Oct 2019 16:19:36 +0300
Message-ID: <8736fub0yf.fsf@intel.com>
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
Cc: linux-usb@vger.kernel.org, corbet@lwn.net, linux-pci@vger.kernel.org,
 Tim.Bird@sony.com, linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-crypto@vger.kernel.org,
 linux-kselftest@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-fpga@vger.kernel.org, changbin.du@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNSBPY3QgMjAxOSwgTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+
IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDExOjI1OjUzQU0gKzAyMDAsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOgo+PiA+IE15IHByZWZlcmVuY2Ugd291bGQgYmUgdG8gdXNlICdz
eW1ib2xzJy4gIEkgdHJpZWQgdG8gY29tZSB1cCB3aXRoIHNvbWV0aGluZwo+PiA+IGJ1dCAnc3lt
Ym9scycgaXMgYmV0dGVyIHRoYW4gYW55dGhpbmcgSSBjYW1lIHVwIHdpdGguCj4+IAo+PiBNYXli
ZSAnaW50ZXJmYWNlcycgb3IgJ2FydGlmYWN0cycuIFRoZSB0ZXJtICdzeW1ib2xzJyBpcyBqdXN0
IGFzCj4+IGltcHJlY2lzZSBhcyAnZnVuY3Rpb25zJy4KPgo+IEkgc3VnZ2VzdGVkICdpZGVudGlm
aWVyJyBiZWNhdXNlIHRoYXQncyB0aGUgdGVybSB1c2VkIGluIHRoZSBDIHNwZWMgKDYuMi4xKToK
Pgo+IDogQW4gaWRlbnRpZmllciBjYW4gZGVub3RlIGFuIG9iamVjdDsgYSBmdW5jdGlvbjsgYSB0
YWcgb3IgYSBtZW1iZXIKPiA6IG9mIGEgc3RydWN0dXJlLCB1bmlvbiwgb3IgZW51bWVyYXRpb247
IGEgdHlwZWRlZiBuYW1lOyBhIGxhYmVsIG5hbWU7Cj4gOiBhIG1hY3JvIG5hbWU7IG9yIGEgbWFj
cm8gcGFyYW1ldGVyLgo+Cj4gV2UgZG9uJ3QgYWxsb3cgZG9jdW1lbnRpbmcgYWxsIHRob3NlIHRo
aW5ncyBzZXBhcmF0ZWx5LCBidXQgaXQgZG9lcyBjb3Zlcgo+IGFsbCB0aGUgdGhpbmdzIHdlIGRv
IGFsbG93IHRvIGJlIGluZGl2aWR1YWxseSBkb2N1bWVudGVkLgoKQWdyZWVkLgoKQlIsCkphbmku
CgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
