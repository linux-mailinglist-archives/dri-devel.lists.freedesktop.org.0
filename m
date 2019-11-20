Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD38710419A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396B26EA8B;
	Wed, 20 Nov 2019 16:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462936EA87;
 Wed, 20 Nov 2019 16:56:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19274758-1500050 for multiple; Wed, 20 Nov 2019 16:56:40 +0000
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87k17uwmlv.fsf@intel.com>
References: <20191119194658.39af50d0@canb.auug.org.au>
 <1d30acd4-9947-d228-967f-c4e76ebca832@infradead.org>
 <87k17uwmlv.fsf@intel.com>
Message-ID: <157426899658.13839.6346197595846229766@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] linux-next: Tree for Nov 19 (i915)
Date: Wed, 20 Nov 2019 16:56:36 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAxOS0xMS0yMCAxNjoxNTowOCkKPiBPbiBUdWUsIDE5IE5v
diAyMDE5LCBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiBP
biAxMS8xOS8xOSAxMjo0NiBBTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPiA+PiBIaSBhbGws
Cj4gPj4gCj4gPj4gQ2hhbmdlcyBzaW5jZSAyMDE5MTExODoKPiA+Cj4gPgo+ID4gb24geDg2XzY0
Ogo+ID4KPiA+IEVSUk9SOiAicG1fc3VzcGVuZF90YXJnZXRfc3RhdGUiIFtkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1LmtvXSB1bmRlZmluZWQhCj4gPgo+ID4gIyBDT05GSUdfU1VTUEVORCBpcyBu
b3Qgc2V0Cj4gCj4gYTcwYTllOTk4ZThlICgiZHJtL2k5MTU6IERlZmVyIHJjNiBzaHV0ZG93biB0
byBzdXNwZW5kX2xhdGUiKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2d0X3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9wbS5jCmluZGV4
IDA2MGVlMGY0NGM3MC4uOTgyMDQwZWNiZDAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9ndF9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X2d0X3BtLmMKQEAgLTI3NSw3ICsyNzUsNyBAQCB2b2lkIGludGVsX2d0X3N1c3BlbmRfcHJlcGFy
ZShzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQoKIHN0YXRpYyBzdXNwZW5kX3N0YXRlX3QgcG1fc3VzcGVu
ZF90YXJnZXQodm9pZCkKIHsKLSNpZiBJU19FTkFCTEVEKENPTkZJR19QTV9TTEVFUCkKKyNpZiBJ
U19FTkFCTEVEKENPTkZJR19TVVNQRU5EKSAmJiBJU19FTkFCTEVEKENPTkZJR19QTV9TTEVFUCkK
CkRlY2xhcmVkIHVuZGVyIFBNX1NMRUVQLgpEZWZpbmVkIHVuZGVyIFNVU1BFTkQuCi1DaHJpcwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
