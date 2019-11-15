Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963EFDC07
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 12:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAE289885;
	Fri, 15 Nov 2019 11:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4A189885;
 Fri, 15 Nov 2019 11:14:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 03:14:40 -0800
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="199171172"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.8.129])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 03:14:37 -0800
MIME-Version: 1.0
To: "Bloomfield, Jon" <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <CAPM=9txqtne1+ycij3YYmxWA1jAOB=VoWCZbjnLb71hwxB7_Cw@mail.gmail.com>
References: <CAPM=9txqtne1+ycij3YYmxWA1jAOB=VoWCZbjnLb71hwxB7_Cw@mail.gmail.com>
Message-ID: <157381647503.4920.10629360010401025572@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: drm-next + i915 CVE yolo merge
Date: Fri, 15 Nov 2019 13:14:35 +0200
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYXZlIEFpcmxpZSAoMjAxOS0xMS0xNCAwMzozMzoyNCkKPiBUaGUgbGFuZGluZyBv
ZiB0aGUgaTkxNSBDVkUgZml4ZXMgaW50byBMaW51cyB0cmVlIGhhcyBjcmVhdGVkIGEgYml0IG9m
Cj4gYSBtZXNzIGluIGxpbnV4LW5leHQgYW5kIGRvd25zdHJlYW0gaW4gZHJtLW5leHQgdHJlZXMu
Cj4gCj4gSSB0YWxrZWQgdG8gRGFuaWVsIGFuZCBoZSBoYWQgdGFsa2VkIHRvIEpvb25hcyBhIGJp
dCwgYW5kIEkgZGVjaWRlZCB0bwo+IGdvIHdpdGggd2hhdCBEYW5pZWwgZGVzY3JpYmVzIGFzIHRo
ZSBZT0xPIG1lcmdlLCB3aGVyZSBJIGp1c3Qgc29sdmUgaXQKPiBhbmQgcHJheSwgYW5kIGV2ZXJ5
b25lIGVsc2UgdmVyaWZpZXMvZml4ZXMgaXQuCj4gCj4gSW4gbXkgZmF2b3VyIEkndmUgYmVlbiBy
ZWFkaW5nIHRoZXNlIHBhdGNoZXMgZm9yIGEgY291cGxlIG9mIG1vbnRocwo+IG5vdyBhbmQgYXBw
bGllZCB0aGVtIHRvIGEgbG90IG9mIHBsYWNlcywgc28gSSdtIHF1aXRlIGZhbWlsaWFyIHdpdGgK
PiB3aGF0IHRoZXkgYXJlIGRvaW5nLgo+IAo+IFRoZSB3b3JzdCBjdWxwcml0IHdhcyB0aGUgUkM2
IGN0eCBjb3JydXB0aW9uIGZpeCBzaW5jZSB0aGUgd2hvbGUgb2YKPiByYzYgZ290IHJlZmFjdG9y
ZWQgaW4gbmV4dC4gSG93ZXZlciBJIGFsc28gaGFkIGFjY2VzcyB0byBhIHZlcnNpb24gb2YKPiB0
aGlzIHBhdGNoIEpvbiB3cm90ZSBvbiBkcm0tdGlwIGEgY291cGxlIG9mIHdlZWtzIGFnby4KCldl
J3ZlIG5vdyB0ZXN0ZWQgZHJtLW5leHQgYW5kIGZvdW5kIGl0IHdvcmtpbmcgZmluZS4gQXMgYSBu
ZXh0IHN0ZXAgSmFuaQp3aWxsIGJlIGJhY2ttZXJnZSB0byBkcm0taW50ZWwtbmV4dC1xdWV1ZWQu
CgpSZWdhcmRzLCBKb29uYXMKCj4gSSB0b29rIHRoYXQgcGF0Y2gsIGFwcGxpZWQgaXQgYW5kIGZp
eGVkIGl0IHVwIG9uIHRvcCBvZiBkcm0tbmV4dC4gVGhlbgo+IEkgYmFja21lcmdlZCB0aGUgY29t
bWl0IHRoYXQgYWxzbyB3ZW50IGludG8gTGludXMnIHRyZWUuIFRoZW4gSQo+IHJlbW92ZWQgYW55
IGV2aWRlbmNlIG9mIHRoZSBSQzYgcGF0Y2ggZnJvbSBMaW51cycgdHJlZSBhbmQgbGVmdCB0aGUK
PiBuZXdlciB2ZXJzaW9uIHBpZWNlcyBpbiBwbGFjZS4gVGhlIG90aGVyIHN0dWZmIG1vc3RseSBt
ZXJnZWQgZmluZSBhbmQKPiB0aGUgcmVzdWx0cyBsb29rZWQgZmluZSwgYnV0IEknZCBkZWZpbml0
ZWx5IHRoaW5rIGV2ZXJ5b25lIGF0IEludGVsCj4gc2hvdWxkIGJlIHN0YXJpbmcgYXQgaXQsIGFu
ZCBteSBkaW5xIHRpcCByZXNvbHV0aW9ucyBBU0FQIGFuZAo+IGhvcGVmdWxseSBpdCBnb2VzIGlu
dG8gQ0kgYW5kIGNvbWVzIG91dCBzbWVsbGluZyBvZiBzb21ldGhpbmcgZ29vZC4KPiAKPiBMZXQg
bWUga25vdyBpZiBpdCdzIGFsbCBob3JyaWJsZSBhc2FwLAo+IFRoYW5rcywKPiBEYXZlLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
