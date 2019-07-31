Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DF57C31C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D85E890BB;
	Wed, 31 Jul 2019 13:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488F789DF7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:17:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 06:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="191241302"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2019 06:17:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
In-Reply-To: <CAK7LNATF+D5TgTZijG3EPBVON5NmN+JcwmCBvnvkMFyR+3wF2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
 <CAK7LNASLfyreDPvNuL1svvHPC0woKnXO_bsNku4DMK6UNn4oHw@mail.gmail.com>
 <5e5353e2-bfab-5360-26b2-bf8c72ac7e70@infradead.org>
 <CAK7LNATF+D5TgTZijG3EPBVON5NmN+JcwmCBvnvkMFyR+3wF2A@mail.gmail.com>
Date: Wed, 31 Jul 2019 16:21:58 +0300
Message-ID: <87v9vimj9l.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNSBKdWwgMjAxOSwgTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29j
aW9uZXh0LmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMjoyMyBQTSBSYW5k
eSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDcvNC8xOSA4
OjA5IFBNLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4+ID4gT24gRnJpLCBKdWwgNSwgMjAxOSBh
dCAxMjowNSBQTSBNYXNhaGlybyBZYW1hZGEKPj4gPiA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4
dC5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+PiBPbiBGcmksIEp1bCA1LCAyMDE5IGF0IDEwOjA5IEFN
IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPj4gPj4+Cj4+ID4+
PiBPbiA3LzQvMTkgMzowMSBQTSwgYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZyB3cm90ZToKPj4g
Pj4+PiBUaGUgbW0tb2YtdGhlLW1vbWVudCBzbmFwc2hvdCAyMDE5LTA3LTA0LTE1LTAxIGhhcyBi
ZWVuIHVwbG9hZGVkIHRvCj4+ID4+Pj4KPj4gPj4+PiAgICBodHRwOi8vd3d3Lm96bGFicy5vcmcv
fmFrcG0vbW1vdG0vCj4+ID4+Pj4KPj4gPj4+PiBtbW90bS1yZWFkbWUudHh0IHNheXMKPj4gPj4+
Pgo+PiA+Pj4+IFJFQURNRSBmb3IgbW0tb2YtdGhlLW1vbWVudDoKPj4gPj4+Pgo+PiA+Pj4+IGh0
dHA6Ly93d3cub3psYWJzLm9yZy9+YWtwbS9tbW90bS8KPj4gPj4+Cj4+ID4+PiBJIGdldCBhIGxv
dCBvZiB0aGVzZSBidXQgZG9uJ3Qgc2VlL2tub3cgd2hhdCBjYXVzZXMgdGhlbToKPj4gPj4+Cj4+
ID4+PiAuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQyOiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9vYS9NYWtlZmlsZTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+PiA+Pj4gbWFrZVs2XTog
KioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJy4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L29hL01h
a2VmaWxlJy4gIFN0b3AuCj4+ID4+PiAuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ5ODogcmVj
aXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9pOTE1L29hJyBmYWlsZWQKPj4gPj4+IG1h
a2VbNV06ICoqKiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvb2FdIEVycm9yIDIKPj4gPj4+IC4uL3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk4OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUv
ZHJtL2k5MTUnIGZhaWxlZAo+PiA+Pj4KPj4gPj4KPj4gPj4gSSBjaGVja2VkIG5leHQtMjAxOTA3
MDQgdGFnLgo+PiA+Pgo+PiA+PiBJIHNlZSB0aGUgZW1wdHkgZmlsZQo+PiA+PiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9vYS9NYWtlZmlsZQo+PiA+Pgo+PiA+PiBEaWQgc29tZW9uZSBkZWxldGUgaXQ/
Cj4+ID4+Cj4+ID4KPj4gPgo+PiA+IEkgdGhpbmsgIm9iai15ICs9IG9hLyIKPj4gPiBpbiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZQo+PiA+IGlzIHJlZHVuZGFudC4KPj4KPj4gVGhhbmtz
LiAgSXQgc2VlbXMgdG8gYmUgd29ya2luZyBhZnRlciBkZWxldGluZyB0aGF0IGxpbmUuCj4KPgo+
IENvdWxkIHlvdSBjaGVjayB3aGV0aGVyIG9yIG5vdAo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L29h
L01ha2VmaWxlIGV4aXN0cyBpbiB5b3VyIHNvdXJjZSB0cmVlPwo+Cj4gWW91ciBidWlsZCBsb2cg
c2F5cyBpdCB3YXMgbWlzc2luZy4KPgo+IEJ1dCwgY29tbWl0IDVlZDdhMGNmMzM5NCAoImRybS9p
OTE1OiBNb3ZlIE9BIGZpbGVzIHRvIHNlcGFyYXRlIGZvbGRlciIpCj4gYWRkZWQgaXQuICAoSXQg
aXMganVzdCBhbiBlbXB0eSBmaWxlKQo+Cj4gSSBhbSBqdXN0IHdvbmRlcmluZyB3aHkuCgpJJ3Zl
IHNlbnQgcGF0Y2hlcyBhZGRpbmcgc29tZSBjb250ZW50LCBhbmQgdGhleSdsbCBtYWtlIHRoZWly
IHdheQp1cHN0cmVhbSBldmVudHVhbGx5LiBJIGFtIG5vdCBzdXJlIHdoeSB0aGUgZW1wdHkgZmls
ZSB3YXMgYWRkZWQKb3JpZ2luYWxseS4gUGVyaGFwcyBhcyBhIHBsYWNlaG9sZGVyLCBzZWVtZWQg
YmVuaWduIGVub3VnaC4KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBT
b3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
