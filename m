Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67FD60090
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 07:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7D76E408;
	Fri,  5 Jul 2019 05:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0080.hostedemail.com
 [216.40.44.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81526E408;
 Fri,  5 Jul 2019 05:22:48 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 85F32181D3368;
 Fri,  5 Jul 2019 05:22:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3867:4321:4605:5007:6119:6742:7903:7904:9121:10004:10400:10848:11232:11233:11657:11658:11914:12297:12555:12679:12740:12760:12895:12986:13069:13311:13357:13439:14659:14721:21080:21627:30054:30055:30060:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: level75_17cfce2dff144
X-Filterd-Recvd-Size: 2521
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Fri,  5 Jul 2019 05:22:43 +0000 (UTC)
Message-ID: <5f4680cce78573ecfbbdc0dfca489710581b966f.camel@perches.com>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Date: Thu, 04 Jul 2019 22:22:41 -0700
In-Reply-To: <20190704220931.f1bd2462907901f9e7aca686@linux-foundation.org>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
 <20190705131435.58c2be19@canb.auug.org.au>
 <20190704220931.f1bd2462907901f9e7aca686@linux-foundation.org>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
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
Cc: mm-commits@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mhocko@suse.cz,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-fsdevel@vger.kernel.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTA0IGF0IDIyOjA5IC0wNzAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+
IGRpZmYoMSkgZG9lc24ndCBzZWVtIHRvIGtub3cgaG93IHRvIGhhbmRsZSBhIHplcm8tbGVuZ3Ro
IGZpbGUuCj4gCj4geTovaG9tZS9ha3BtPiBta2RpciBmb28KPiB5Oi9ob21lL2FrcG0+IGNkIGZv
bwo+IHk6L2hvbWUvYWtwbS9mb28+IHRvdWNoIHgKPiB5Oi9ob21lL2FrcG0vZm9vPiBkaWZmIC11
TiB4IHkKPiB5Oi9ob21lL2FrcG0vZm9vPiBkYXRlID4geAo+IHk6L2hvbWUvYWtwbS9mb28+IGRp
ZmYgLXVOIHggeQo+IC0tLSB4ICAgMjAxOS0wNy0wNCAyMTo1ODozNy44MTUwMjgyMTEgLTA3MDAK
PiArKysgeSAgIDE5NjktMTItMzEgMTY6MDA6MDAuMDAwMDAwMDAwIC0wODAwCj4gQEAgLTEgKzAs
MCBAQAo+IC1UaHUgSnVsICA0IDIxOjU4OjM3IFBEVCAyMDE5Cj4gCj4gU28gd2hlbiBjb21wYXJp
bmcgYSB6ZXJvLWxlbmd0aCBmaWxlIHdpdGggYSBub24tZXhpc3RlbnQgZmlsZSwgZGlmZgo+IHBy
b2R1Y2VzIG5vIG91dHB1dC4KCldoeSB1c2UgdGhlIC1OIG9wdGlvbiA/CgokIGRpZmYgLS1oZWxw
ClsuLi5dCiAgLU4sIC0tbmV3LWZpbGUgICAgICAgICAgICAgICAgICB0cmVhdCBhYnNlbnQgZmls
ZXMgYXMgZW1wdHkKCm90aGVyd2lzZQoKJCBjZCAkKG1rdGVtcCAtZCAtcCAuKQokIHRvdWNoIHgK
JCBkaWZmIC11IHggeQpkaWZmOiB5OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
