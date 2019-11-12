Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B52F9602
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 17:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114E36EB75;
	Tue, 12 Nov 2019 16:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFEF6EB75
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 16:50:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 08:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; d="scan'208";a="202470204"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 12 Nov 2019 08:50:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 12 Nov 2019 18:50:20 +0200
Date: Tue, 12 Nov 2019 18:50:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
Subject: Re: [PATCH libdrm v3] modetest: Add support for setting mode having
 floating vertical refresh rate
Message-ID: <20191112165020.GR1208@intel.com>
References: <1573472842-4626-1-git-send-email-devarsh.thakkar@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573472842-4626-1-git-send-email-devarsh.thakkar@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: rsk@xilinx.com, vcu-team@xilinx.com, dshah@xilinx.com,
 dri-devel@lists.freedesktop.org, varunkum@xilinx.com, satishna@xilinx.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDM6NDc6MjJBTSAtMDgwMCwgRGV2YXJzaCBUaGFra2Fy
IHdyb3RlOgo+IEZvciB0aGUgc2NlbmFyaW8gd2hlcmUgdXNlciBtYXkgcmVxdWlyZSB0byBtb2Rl
c2V0IHdpdGggYSBtb2RlCj4gc3VwcG9ydGluZyBhIGZyYWN0aW9uYWwgdmFsdWUgZm9yIHZlcnRp
Y2FsIHJlZnJlc2gtcmF0ZSwKPiBhcHByb3ByaWF0ZSBtb2RlIGNhbiBiZSBzZWxlY3RlZCBieSBz
ZWFyY2hpbmcgZm9yIG1vZGUKPiBoYXZpbmcgbWF0Y2hpbmcgZnJhY3Rpb25hbCB2ZXJ0aWNhbCBy
ZWZyZXNoIHJhdGUgdXNpbmcKPiBiZWxvdyBlcXVhdGlvbi4KPiAKPiB2cmVmcmVzaCA9ICgxMDAw
ICogcGl4ZWwgY2xvY2spIC8gKGh0b3RhbCAqIHZ0b3RhbCkgSHouCj4gCj4gV2UgZG8gdGhpcyB3
YXkgc2luY2UgZHJpdmVyIGRvZXNuJ3QgcmV0dXJuIGZsb2F0IHZhbHVlIG9mIHZyZWZyZXNoCj4g
YXMgaXQgdXNlIGludCBmb3IgdnJlZnJlc2ggaW4gc3RydWN0IGRybV9tb2RlX2luZm8sIGJ1dCB3
ZSBjYW4gZGVyaXZlCj4gdGhlIGFjdHVhbCB2YWx1ZSB1c2luZyBwaXhlbCBjbG9jaywgaG9yaXpv
bnRhbCB0b3RhbCBzaXplIGFuZAo+IHZlcnRpY2FsIHRvdGFsIHNpemUgdmFsdWVzLgo+IAo+IFNv
IGZvciBlLmcuIGlmIHVzZXIgd2FudCB0byBzZWxlY3QgbW9kZSBoYXZpbmcgNTkuOTQgSHogYXMg
cmVmcmVzaCByYXRlCj4gdGhlbiB3aXRoIHRoaXMgcGF0Y2ggaXQgYmUgY2FuIGRvbmUgYXMgc2hv
d24gaW4gYmVsb3cgY29tbWFuZCwKPiBnaXZlbiB0aGVyZSBpcyBhbiBhcHByb3ByaWF0ZSBtb2Rl
IGlzIGF2YWlsYWJsZSA6Cj4gCj4gbW9kZXRlc3QgLU0geGxueCAtcyAzOToxOTIweDEwODAtNTku
OTRAQkcyNCAtdgo+IAo+IE5PVEU6IEFib3ZlIGNvbW1hbmQgd2FzIHRlc3RlZCBvbiB4aWxpbngg
RFJNIGRyaXZlciB3aXRoIERQCj4gbW9uaXRvciB3aGljaCB3YXMgc3VwcG9ydGluZyBtb2RlIGhh
dmluZyA1OS45NCBIeiByZWZyZXNoIHJhdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGV2YXJzaCBU
aGFra2FyIDxkZXZhcnNoLnRoYWtrYXJAeGlsaW54LmNvbT4KPiAtLS0KPiBWMjogVXBkYXRlIGNv
bW1pdCBtZXNzYWdlCj4gVjM6IFVwZGF0ZSB3aXRoIGJlbG93IGNoYW5nZXMgYXMgcGVyIHJldmll
dyBjb21tZW50cyA6Cj4gICAxKSBVc2UgZXBzaWxvbiBmb3IgdnJlZnJlc2ggY29tcGFyaXNvbgo+
ICAgMikgVXNlIGltcGxpY2l0IHR5cGUtY2FzdGluZyB3aGVyZXZlciBwb3NzaWJsZQoKUGxlYXNl
IGtlZXAgdGhlc2UgaW4gdGhlIGNvbW1pdCBtc2cgcHJvcGVyLiBXZSBwcmVmZXIgdGhlc2UgdGhp
bmdzCnRvIGhhbmcgYXJvdW5kIGV2ZW4gd2hlbiB0aGUgcGF0Y2ggZ2V0cyBwdXNoZWQuCgpQYXRj
aCBsZ3RtLgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KCj4gCj4gVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBpbnRl
bmRlZCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBuYW1lZCByZWNpcGllbnQocykgYW5kIGNvbnRh
aW4ocykgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkIG9yIGNvcHlyaWdodGVkIHVuZGVyIGFwcGxpY2FibGUgbGF3LiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBkbyBub3QgcmVhZCwgY29weSwgb3IgZm9yd2Fy
ZCB0aGlzIGVtYWlsIG1lc3NhZ2Ugb3IgYW55IGF0dGFjaG1lbnRzLiBEZWxldGUgdGhpcyBlbWFp
bCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgaW1tZWRpYXRlbHkuCgpZb3Ugc2hvdWxkIGRv
IHNvbWV0aGluZyB0byBlbGltaW5hdGUgdGhpcy4gRG9lc24ndCBtYWtlIHNlbnNlIGZvcgpvcGVu
IHNvdXJjZSBzdHVmZi4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
