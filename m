Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D65B149
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1385B89DC0;
	Sun, 30 Jun 2019 18:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BD76E8CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:32:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 03:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="183662811"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 28 Jun 2019 03:32:04 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 28 Jun 2019 13:32:04 +0300
Date: Fri, 28 Jun 2019 13:32:04 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
Message-ID: <20190628103204.GJ2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
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

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTI6MjM6MDlQTSArMDIwMCwgVGltdXIgS3Jpc3TDs2Yg
d3JvdGU6Cj4gSGkgZ3V5cywKPiAKPiBJIHVzZSBhbiBBTUQgUlggNTcwIGluIGEgVGh1bmRlcmJv
bHQgMyBleHRlcm5hbCBHUFUgYm94Lgo+IGRtZXNnIGdpdmVzIG1lIHRoZSBmb2xsb3dpbmcgbWVz
c2FnZToKPiBwY2kgMDAwMDozYTowMC4wOiA4LjAwMCBHYi9zIGF2YWlsYWJsZSBQQ0llIGJhbmR3
aWR0aCwgbGltaXRlZCBieSAyLjUgR1QvcyB4NCBsaW5rIGF0IDAwMDA6MDQ6MDQuMCAoY2FwYWJs
ZSBvZiAzMS41MDQgR2IvcyB3aXRoIDggR1QvcyB4NCBsaW5rKQo+IAo+IEhlcmUgaXMgYSB0cmVl
IHZpZXcgb2YgdGhlIGRldmljZXMgYXMgd2VsbCBhcyB0aGUgb3V0cHV0IG9mIGxzcGNpIC12dnY6
Cj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vQ1NzUzJha1oKPiAKPiBUaGUgY3JpdGljYWwgcGF0aCBv
ZiB0aGUgZGV2aWNlIHRyZWUgbG9va3MgbGlrZSB0aGlzOgo+IAo+IDAwOjFjLjQgSW50ZWwgQ29y
cG9yYXRpb24gU3VucmlzZSBQb2ludC1MUCBQQ0kgRXhwcmVzcyBSb290IFBvcnQgIzUgKHJldiBm
MSkKPiAwMzowMC4wIEludGVsIENvcnBvcmF0aW9uIEpITDY1NDAgVGh1bmRlcmJvbHQgMyBCcmlk
Z2UgKEMgc3RlcCkgW0FscGluZSBSaWRnZSA0QyAyMDE2XSAocmV2IDAyKQo+IDA0OjA0LjAgSW50
ZWwgQ29ycG9yYXRpb24gSkhMNjU0MCBUaHVuZGVyYm9sdCAzIEJyaWRnZSAoQyBzdGVwKSBbQWxw
aW5lIFJpZGdlIDRDIDIwMTZdIChyZXYgMDIpCj4gM2E6MDAuMCBJbnRlbCBDb3Jwb3JhdGlvbiBE
U0w2NTQwIFRodW5kZXJib2x0IDMgQnJpZGdlIFtBbHBpbmUgUmlkZ2UgNEMgMjAxNV0KPiAzYjow
MS4wIEludGVsIENvcnBvcmF0aW9uIERTTDY1NDAgVGh1bmRlcmJvbHQgMyBCcmlkZ2UgW0FscGlu
ZSBSaWRnZSA0QyAyMDE1XQo+IDNjOjAwLjAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBb
QU1EL0FUSV0gRWxsZXNtZXJlIFtSYWRlb24gUlggNDcwLzQ4MC81NzAvNTcwWC81ODAvNTgwWC81
OTBdIChyZXYgZWYpCj4gCj4gSGVyZSBpcyB0aGUgd2VpcmQgcGFydDoKPiAKPiBBY2NvZGluZyB0
byBsc3BjaSwgYWxsIG9mIHRoZXNlIGRldmljZXMgcmVwb3J0IGluIHRoZWlyIExua0NhcCB0aGF0
Cj4gdGhleSBzdXBwb3J0IDggR1QvcywgZXhjZXB0IHRoZSAwNDowNC4wIGFuZCAzYTowMC4wIHdo
aWNoIHNheSB0aGV5IG9ubHkKPiBzdXBwb3J0IDIuNSBHVC9zLiBDb250cmFkaWN0b3J5IHRvIGxz
cGNpLCBzeXNmcyBvbiB0aGUgb3RoZXIgaGFuZCBzYXlzCj4gdGhhdCBib3RoIG9mIHRoZW0gYXJl
IGNhcGFibGUgb2YgOCBHVC9zIGFzIHdlbGw6Cj4gIi9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDA6
MDQ6MDQuMC9tYXhfbGlua19zcGVlZCIgYW5kCj4gIi9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDA6
M2E6MDAuMC9tYXhfbGlua19zcGVlZCIgYXJlIDggR1Qvcy4KPiBJdCBzZWVtcyB0aGF0IHRoZXJl
IGlzIGEgZGlzY3JlcGFuY3kgYmV0d2VlbiB3aGF0IGxzcGNpIHRoaW5rcyBhbmQgd2hhdAo+IHRo
ZSBkZXZpY2VzIGFyZSBhY3R1YWxseSBjYXBhYmxlIG9mLgo+IAo+IFF1ZXN0aW9uczoKPiAKPiAx
LiBXaHkgYXJlIHRoZXJlIGZvdXIgYnJpZGdlIGRldmljZXM/IDA0OjAwLjAsIDA0OjAxLjAgYW5k
IDA0OjAyLjAgbG9vawo+IHN1cGVyZmx1b3VzIHRvIG1lIGFuZCBub3RoaW5nIGlzIGNvbm5lY3Rl
ZCB0byB0aGVtLiBJdCBhY3R1YWxseSBnaXZlcwo+IG1lIHRoZSBmZWVsaW5nIHRoYXQgdGhlIFRC
MyBkcml2ZXIgY3JlYXRlcyA0IGRldmljZXMgd2l0aCAyLjUgR1Qvcwo+IGVhY2gsIGluc3RlYWQg
b2Ygb25lIGRldmljZSB0aGF0IGNhbiBkbyB0aGUgZnVsbCA4IEdUL3MuCgpCZWNhdXNlIGl0IGlz
IHN0YW5kYXJkIFBDSWUgc3dpdGNoIHdpdGggb25lIHVwc3RyZWFtIHBvcnQgYW5kIG4KZG93bnN0
cmVhbSBwb3J0cy4KCj4gMi4gV2h5IGFyZSBzb21lIG9mIHRoZSBicmlkZ2UgZGV2aWNlcyBvbmx5
IGNhcGFibGUgb2YgMi41IEdUL3MKPiBhY2NvcmRpbmcgdG8gbHNwY2k/CgpZb3UgbmVlZCB0byB0
YWxrIHRvIGxzcGNpIG1haW50YWluZXIuCgo+IDMuIElzIGl0IHBvc3NpYmxlIHRvIG1hbnVhbGx5
IHNldCB0aGVtIHRvIDggR1Qvcz8KCk5vIGlkZWEuCgpBcmUgeW91IGFjdHVhbGx5IHNlZWluZyBz
b21lIHBlcmZvcm1hbmNlIGlzc3VlIGJlY2F1c2Ugb2YgdGhpcyBvciBhcmUKeW91IGp1c3QgY3Vy
aW91cz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
