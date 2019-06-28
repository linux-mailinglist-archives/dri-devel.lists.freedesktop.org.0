Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC845B12E
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A757189CDE;
	Sun, 30 Jun 2019 18:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB156E8E7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:53:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 05:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="183680620"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 28 Jun 2019 05:53:47 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 28 Jun 2019 15:53:47 +0300
Date: Fri, 28 Jun 2019 15:53:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
Message-ID: <20190628125346.GM2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDI6MjE6MzZQTSArMDIwMCwgVGltdXIgS3Jpc3TDs2Yg
d3JvdGU6Cj4gCj4gPiA+IFN1cmUsIHRob3VnaCBpbiB0aGlzIGNhc2UgMyBvZiB0aG9zZSBkb3du
c3RyZWFtIHBvcnRzIGFyZSBub3QKPiA+ID4gZXhwb3NlZAo+ID4gPiBieSB0aGUgaGFyZHdhcmUs
IHNvIGl0J3MgYSBiaXQgc3VycHJpc2luZyB0byBzZWUgdGhlbSB0aGVyZS4KPiA+IAo+ID4gVGhl
eSBsZWFkIHRvIG90aGVyIHBlcmlwaGVyYWxzIG9uIHRoZSBUQlQgaG9zdCByb3V0ZXIgc3VjaCBh
cyB0aGUgVEJUCj4gPiBjb250cm9sbGVyIGFuZCB4SENJLiBBbHNvIHRoZXJlIGFyZSB0d28gZG93
bnN0cmVhbSBwb3J0cyBmb3IKPiA+IGV4dGVuc2lvbgo+ID4gZnJvbSB3aGljaCB5b3UgZUdQVSBp
cyB1c2luZyBvbmUuCj4gCj4gSWYgeW91IGxvb2sgYXQgdGhlIGRldmljZSB0cmVlIGZyb20gbXkg
Zmlyc3QgZW1haWwsIHlvdSBjYW4gc2VlIHRoYXQKPiBib3RoIHRoZSBHUFUgYW5kIHRoZSBYSENJ
IHVzZXMgdGhlIHNhbWUgcG9ydDogMDQ6MDQuMCAtIGluIGZhY3QgSSBjYW4KPiBldmVuIHJlbW92
ZSB0aGUgb3RoZXIgMyBwb3J0cyBmcm9tIHRoZSBzeXN0ZW0gd2l0aG91dCBhbnkgY29uc2VxdWVu
Y2VzLgoKV2VsbCB0aGF0J3MgdGhlIGV4dGVuc2lvbiBQQ0llIGRvd25zdHJlYW0gcG9ydC4gVGhl
IG90aGVyIG9uZSBpcwowNDowMS4wLgoKVHlwaWNhbGx5IDA0OjAwLjAgYW5kIDA0OjAwLjIgYXJl
IHVzZWQgdG8gY29ubmVjdCBUQlQgKDA1OjAwLjApIGFuZCB4SENJCigzOTowMC4wKSBidXQgaW4g
eW91ciBjYXNlIHlvdSBkb24ndCBzZWVtIHRvIGhhdmUgVVNCIDMgZGV2aWNlcwpjb25uZWN0ZWQg
dG8gdGhhdCBzbyBpdCBpcyBub3QgcHJlc2VudC4gSWYgeW91IHBsdWcgaW4gVVNCLUMgZGV2aWNl
Cihub24tVEJUKSB5b3Ugc2hvdWxkIHNlZSB0aGUgaG9zdCByb3V0ZXIgeEhDSSBhcHBlYXJpbmcg
YXMgd2VsbC4KClRoaXMgaXMgcHJldHR5IHN0YW5kYXJkIHRvcG9sb2d5LgoKPiA+ID4gTGlrZSBJ
IHNhaWQgdGhlIGRldmljZSByZWFsbHkgaXMgbGltaXRlZCB0byAyLjUgR1QvcyBldmVuIHRob3Vn
aCBpdAo+ID4gPiBzaG91bGQgYmUgYWJsZSB0byBkbyA4IEdUL3MuCj4gPiAKPiA+IFRoZXJlIGlz
IFRodW5kZXJib2x0IGxpbmsgYmV0d2VlbiB0aGUgaG9zdCByb3V0ZXIgKHlvdXIgaG9zdCBzeXN0
ZW0pCj4gPiBhbmQKPiA+IHRoZSBlR1BVIGJveC4gVGhhdCBsaW5rIGlzIG5vdCBsaW1pdGVkIHRv
IDIuNSBHVC9zIHNvIGV2ZW4gaWYgdGhlCj4gPiBzbG90Cj4gPiBjbGFpbXMgaXQgaXMgUENJIGdl
bjEgdGhlIGFjdHVhbCBiYW5kd2lkdGggY2FuIGJlIG11Y2ggaGlnaGVyIGJlY2F1c2UKPiA+IG9m
Cj4gPiB0aGUgdmlydHVhbCBsaW5rLgo+IAo+IE5vdCBzdXJlIEkgdW5kZXJzdGFuZCBjb3JyZWN0
bHksIGFyZSB5b3Ugc2F5aW5nIHRoYXQgVEIzIGNhbiBkbyA0MAo+IEdiaXQvc2VjIGV2ZW4gdGhv
dWdoIHRoZSBrZXJuZWwgdGhpbmtzIGl0IGNhbiBvbmx5IGRvIDggR2JpdCAvIHNlYz8KClllcyB0
aGUgUENJZSBzd2l0Y2ggdXBzdHJlYW0gcG9ydCAoM2E6MDAuMCkgaXMgY29ubmVjdGVkIGJhY2sg
dG8gdGhlCmhvc3Qgcm91dGVyIG92ZXIgdmlydHVhbCBUaHVuZGVyYm9sdCA0MEdiL3MgbGluayBz
byB0aGUgUENJZSBnZW4xIHNwZWVkcwppdCByZXBvcnRzIGRvIG5vdCByZWFsbHkgbWF0dGVyIGhl
cmUgKHNhbWUgZ29lcyBmb3IgdGhlIGRvd25zdHJlYW0pLgoKVGhlIHRvcG9sb2d5IGxvb2tzIGxp
a2UgYmVsbG93IGlmIEkgZ290IGl0IHJpZ2h0IGZyb20gdGhlIGxzcGNpIG91dHB1dDoKCiAgMDA6
MWMuNCAocm9vdCBwb3J0KSA4IEdUL3MgeCA0CiAgICBeCiAgICB8IHJlYWwgUENJZSBsaW5rCiAg
ICB2CiAgMDM6MDAuMCAodXBzdHJlYW0gcG9ydCkgOCBHVC9zIHggNAogIDA0OjA0LjAgKGRvd25z
dHJlYW0gcG9ydCkgMi41IEdUL3MgeCA0CiAgICBeCiAgICB8ICB2aXJ0dWFsIGxpbmsgNDAgR2Iv
cwogICAgdgogIDNhOjAwLjAgKHVwc3RyZWFtIHBvcnQpIDIuNSBHVC9zIHggNAogIDNiOjAxLjAg
KGRvd25zdHJlYW0gcG9ydCkgOCBHVC9zIHggNAogICAgXgogICAgfCByZWFsIFBDSWUgbGluawog
ICAgdgogIDNjOjAwLjAgKGVHUFUpIDggR1QvcyB4IDQKCkluIG90aGVyIHdvcmRzIGFsbCB0aGUg
cmVhbCBQQ0llIGxpbmtzIHJ1biBhdCBmdWxsIDggR1QvcyB4IDQgd2hpY2ggaXMKd2hhdCBpcyBl
eHBlY3RlZCwgSSB0aGluay4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
