Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E619C4C482
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 02:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088B46E495;
	Thu, 20 Jun 2019 00:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0169.hostedemail.com
 [216.40.44.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696616E487;
 Thu, 20 Jun 2019 00:35:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 4743D18032D42;
 Thu, 20 Jun 2019 00:35:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: slope21_83935d3c81a36
X-Filterd-Recvd-Size: 3615
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Thu, 20 Jun 2019 00:35:03 +0000 (UTC)
Message-ID: <d8316be322f33ea67640ff83f2248fe433078407.camel@perches.com>
Subject: Re: [PATCH v3 0/7] Hexdump Enhancements
From: Joe Perches <joe@perches.com>
To: Alastair D'Silva <alastair@d-silva.org>
Date: Wed, 19 Jun 2019 17:35:01 -0700
In-Reply-To: <c68cb819257f251cbb66f8998a95c31cebe2d72e.camel@d-silva.org>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <9a000734375c0801fc16b71f4be1235f9b857772.camel@perches.com>
 <c68cb819257f251cbb66f8998a95c31cebe2d72e.camel@d-silva.org>
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>,
 Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA2LTIwIGF0IDA5OjE1ICsxMDAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+IE9uIFdlZCwgMjAxOS0wNi0xOSBhdCAwOTozMSAtMDcwMCwgSm9lIFBlcmNoZXMgd3JvdGU6
Cj4gPiBPbiBNb24sIDIwMTktMDYtMTcgYXQgMTI6MDQgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEg
d3JvdGU6Cj4gPiA+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3Jn
Pgo+ID4gPiAKPiA+ID4gQXBvbG9naWVzIGZvciB0aGUgbGFyZ2UgQ0MgbGlzdCwgaXQncyBhIGhl
YWRzIHVwIGZvciB0aG9zZQo+ID4gPiByZXNwb25zaWJsZQo+ID4gPiBmb3Igc3Vic3lzdGVtcyB3
aGVyZSBhIHByb3RvdHlwZSBjaGFuZ2UgaW4gZ2VuZXJpYyBjb2RlIGNhdXNlcyBhCj4gPiA+IGNo
YW5nZQo+ID4gPiBpbiB0aG9zZSBzdWJzeXN0ZW1zLgo+ID4gPiAKPiA+ID4gVGhpcyBzZXJpZXMg
ZW5oYW5jZXMgaGV4ZHVtcC4KPiA+IAo+ID4gU3RpbGwgbm90IGEgZmFuIG9mIHRoZXNlIHBhdGNo
ZXMuCj4gCj4gSSdtIGFmcmFpZCB0aGVyZSdzIG5vdCB0b28gbXVjaCBhY3Rpb24gSSBjYW4gdGFr
ZSBvbiB0aGF0LCBJJ20gaGFwcHkgdG8KPiBhZGRyZXNzIHNwZWNpZmljIGlzc3VlcyB0aG91Z2gu
Cj4gCj4gPiA+IFRoZXNlIGltcHJvdmUgdGhlIHJlYWRhYmlsaXR5IG9mIHRoZSBkdW1wZWQgZGF0
YSBpbiBjZXJ0YWluCj4gPiA+IHNpdHVhdGlvbnMKPiA+ID4gKGVnLiB3aWRlIHRlcm1pbmFscyBh
cmUgYXZhaWxhYmxlLCBtYW55IGxpbmVzIG9mIGVtcHR5IGJ5dGVzIGV4aXN0LAo+ID4gPiBldGMp
LgoKSSB0aGluayBpdCdzIGdlbmVyYWxseSBvdmVya2lsbCBmb3IgdGhlIGRlc2lyZWQgdXNlcy4K
Cj4gPiBDaGFuZ2luZyBoZXhkdW1wJ3MgbGFzdCBhcmd1bWVudCBmcm9tIGJvb2wgdG8gaW50IGlz
IG9kZC4KPiA+IAo+IAo+IFRoaW5rIG9mIGl0IGFzIHJlcGxhY2luZyBhIHNpbmdsZSBib29sZWFu
IHdpdGggbWFueSBib29sZWFucy4KCkkgdW5kZXJzdGFuZCBpdC4gIEl0J3Mgb2RkLgoKSSB3b3Vs
ZCByYXRoZXIgbm90IGhhdmUgYSBtaXh0dXJlIG9mIHRydWUsIGZhbHNlLCBhbmQgYXBwYXJlbnRs
eQpyYW5kb20gY29sbGVjdGlvbnMgb2YgYml0ZmllbGRzIGxpa2UgMHhkIG9yIDBiMTAxMSBvciB0
aGVpcgplcXVpdmFsZW50IG9yJ2QgZGVmaW5lcy4KCgo+IFRoZXJlJ3Mgb25seSBhIGhhbmRmdWwg
b2YgY29uc3VtZXJzLCBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgdmFsdWUtYWRkIAo+IGluIGNy
ZWF0aW5nIG1vcmUgd3JhcHBlcnMgdnMgdXBkYXRpbmcgdGhlIGV4aXN0aW5nIGNhbGxlcnMuCgpQ
ZXJoYXBzIG1vcmUgcmVhc29uIG5vdCB0byBtb2RpZnkgdGhlIGV4aXN0aW5nIGFwaS4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
