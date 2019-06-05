Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C3035886
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 10:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8122B89349;
	Wed,  5 Jun 2019 08:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCC089349
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:29:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A76C880407;
 Wed,  5 Jun 2019 10:29:43 +0200 (CEST)
Date: Wed, 5 Jun 2019 10:29:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 0/2] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Message-ID: <20190605082942.GC15169@ravnborg.org>
References: <cover.1559711222.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1559711222.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=DwvPuToIzeF-Hk4mpeMA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: linux-omap@vger.kernel.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlrb2xhdXMuCgpUaGFua3MgZm9yIHRoZSBuZXcgcGFuZWwgcGF0Y2hlcy4KT24gV2VkLCBK
dW4gMDUsIDIwMTkgYXQgMDc6MDc6MDFBTSArMDIwMCwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgd3Jv
dGU6Cj4gVjI6Cj4gKiBmaXggdHlwbyBpbiA5OWR0YyBwYW5lbCBjb21wYXRpYmxlIHN0cmluZyAo
cmVwb3J0ZWQgYnkgaW1pcmtpbkBhbHVtLm1pdC5lZHUpCj4gCj4gVjE6Cj4gCj4gU2luY2UgdjUu
Mi1yYzEgT01BUCBpcyBubyBsb25nZXIgdXNpbmcgYSBzcGVjaWFsIGRpc3BsYXkgZHJpdmVyIGFy
Y2hpdGVjdHVyZQo+IGZvciBEUEkgcGFuZWxzLCBidXQgdXNlcyB0aGUgZ2VuZXJhbCBkcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLgo+IAo+IFNvIHdlIGZpbmFsbHkgY2FuIGFkZCBTb0MgaW5kZXBlbmRl
bnQgcGFuZWwgZGVmaW5pdGlvbnMgZm9yIHR3byBwYW5lbCBtb2RlbHMKPiB3aGljaCB3ZSBhbHJl
YWR5IGhhZCB3b3JrZWQgb24gcXVpdGUgYSB3aGlsZSBhZ28gKGJlZm9yZSBkZXZpY2UgdHJlZSB3
YXMKPiBpbnRyb2R1Y2VkKToKPiAKPiAJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8yODUxMjk1Lwo+IAo+IAo+IAo+IEguIE5pa29sYXVzIFNjaGFsbGVyICgyKToKPiAgIGRybS9w
YW5lbDogc2ltcGxlOiBBZGQgU2hhcnAgTFEwNzBZM0RHM0IgcGFuZWwgc3VwcG9ydAo+ICAgZHJt
L3BhbmVsOiBzaW1wbGU6IEFkZCBPcnR1c3RlY2ggQ09NMzdIM00gcGFuZWwgc3VwcG9ydAoKQWxs
IHRocmVlIHBhbmVscyBhcmUgbWlzc2luZyBiaW5kaW5nIGRvY3VtZW50YXRpb24uClBsZWFzZSBz
dWJtaXQgYmluZGluZyBkb2N1bWVudGF0aW9uLCBpbiBzZXBhcmF0ZSBwYXRjaGVzLCB3aXRoCnBy
b3BlciAiZHQtYmluZGluZ3M6IHh4eCIgc3ViamVjdHMuClNlZSBEb2N1bWVudGF0aW9uL2Rldmlj
ZS10cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmcuLi4KClBhdGNoZXMgbm90IGFwcGxpZWQgZHVlIHRv
IHRoZSBtaXNzaW5nIGRvY3MuCkJ1dCB0aGUgcGF0Y2hlcyBpdHNlbGYgbG9va2VkIGdvb2QuCllv
dSBoYXZlIHNwZWNpZmllZCBidXNfZmxhZ3MgZXRjLCBhbmQgYWRkZWQgdGhlCm5ldyBlbnRyaWVz
IGluIGNvcnJlY3QgYWxwaGFiZXRpY2FsIG9yZGVyIGV0Yy4KCglTYW0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
