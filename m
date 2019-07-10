Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0897264D86
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 22:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD436E12F;
	Wed, 10 Jul 2019 20:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C3F6E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 20:27:54 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id u14so1626846pfn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 13:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hO2jzOM05mxrz5IGdqgpee+axiQH+2OXPmqo+Ul0FcM=;
 b=N5kFQhiih5BJIpB5r0+66MTWLPhaFPBcZtTaTdO1E69GYeJ51OtwvPAQs3xBfka4S6
 mvOyszshehBNDynE+FQdHcWhqsEkPOwER1dfZX5dk55V1IHBmYvuWpAB41lwU2o/F/IX
 zje72QkLsABE4FKC5k7zbtLNDRw0OhrF+9C5ko3mCtbAHWwWZ6NnRgo0eFv5BBVs/tbp
 GSLF14Z3DshBb1DyOu3tyibV8epKAyPjmiXoYM6Bd8QVHLBuLbBBOuk5k0UkoZTbHHuG
 hnrvJFs7e5qNYOcvLipjzhTqdYAE39Fz0DsDYvVdDIyQ/3P0kqrRthbEJERJBmp55+iJ
 uLwA==
X-Gm-Message-State: APjAAAVt6Sg1eqRvmLPJBONdXdbchdzmWNvzfrYl4UCqCZoRTrGGEDfZ
 tK3nTyAkmxjPu6WjDySwXyDSnzH2vwmc2QNeKuBVYg==
X-Google-Smtp-Source: APXvYqzZdlWhCkBvFW8XUuT2KDhsG6TgutjUsDP74lsWb4XjESrHCjQll9Q/yu+3XrTs4ARL+yM6pPyLsGbtB4DuWT0=
X-Received: by 2002:a63:205f:: with SMTP id r31mr109331pgm.159.1562790473396; 
 Wed, 10 Jul 2019 13:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-17-brendanhiggins@google.com>
 <7cc417dd-036f-7dc1-6814-b1fdac810f03@kernel.org>
 <CAFd5g4595X8cM919mohQVaShs4dKWzZ_-2RVB=6SH3RdVMwuQw@mail.gmail.com>
In-Reply-To: <CAFd5g4595X8cM919mohQVaShs4dKWzZ_-2RVB=6SH3RdVMwuQw@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 10 Jul 2019 13:27:42 -0700
Message-ID: <CAFd5g45zFhBN-yrJbRt6KnFkYKxVqjs9qeQULCSD6z89vvG-Tg@mail.gmail.com>
Subject: Re: [PATCH v7 16/18] MAINTAINERS: add entry for KUnit the unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hO2jzOM05mxrz5IGdqgpee+axiQH+2OXPmqo+Ul0FcM=;
 b=DXE2TyoaAsiT9dgVdMLJlwnFOJG+VPwltPNRpKt3x1FLvKASU/iQDS/su9pWcI6ZPd
 MXkkWpKWuusX2P8emSJdJDlt30oE5SxYRezHyYxpjjVp3ZbcLi8A3iWXovzH83yYRc8k
 fjxQns6K5/tsiMazqiGGWLPX8o1RPbeCk84rZYGhBrbKZfsdxcSVvoPDO0y7puTr2iGH
 fQNI4xvqDUtOGBpEZRrc5xNRkpC2AFKD+tShr+e3Bwk8ghWvxHexXjknk4e4/Fuddr4K
 h5eIBtrjZWB7rbYTWe1Z8/fz44NvT2DlWtjdcUYum8NYmtJkqcBIajW2gxCHzFBMqhlz
 2q0w==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAxMTowMSBBTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgOSwgMjAxOSBhdCA3OjUz
IEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiA3LzkvMTkgMTI6
MzAgQU0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ID4gQWRkIG15c2VsZiBhcyBtYWludGFp
bmVyIG9mIEtVbml0LCB0aGUgTGludXgga2VybmVsJ3MgdW5pdCB0ZXN0aW5nCj4gPiA+IGZyYW1l
d29yay4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFu
aGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+ID4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1
bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgTUFJTlRBSU5F
UlMgfCAxMSArKysrKysrKysrKwo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4g
PiA+IGluZGV4IDY3N2VmNDFjYjAxMmMuLjQ4ZDA0ZDE4MGE5ODggMTAwNjQ0Cj4gPiA+IC0tLSBh
L01BSU5UQUlORVJTCj4gPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiA+IEBAIC04NTk5LDYgKzg1
OTksMTcgQEAgUzogICAgIE1haW50YWluZWQKPiA+ID4gICBGOiAgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvCj4gPiA+ICAgRjogIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2tzZWxmdGVzdCoKPiA+
ID4KPiA+ID4gK0tFUk5FTCBVTklUIFRFU1RJTkcgRlJBTUVXT1JLIChLVW5pdCkKPiA+ID4gK006
ICAgQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gPiArTDog
ICBsaW51eC1rc2VsZnRlc3RAdmdlci5rZXJuZWwub3JnCj4gPiA+ICtMOiAgIGt1bml0LWRldkBn
b29nbGVncm91cHMuY29tCj4gPiA+ICtXOiAgIGh0dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9rdW5p
dC1kb2NzL3RoaXJkX3BhcnR5L2tlcm5lbC9kb2NzLwo+ID4gPiArUzogICBNYWludGFpbmVkCj4g
PiA+ICtGOiAgIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0Lwo+ID4gPiArRjogICBpbmNs
dWRlL2t1bml0Lwo+ID4gPiArRjogICBrdW5pdC8KPiA+ID4gK0Y6ICAgdG9vbHMvdGVzdGluZy9r
dW5pdC8KPiA+ID4gKwo+ID4gPiAgIEtFUk5FTCBVU0VSTU9ERSBIRUxQRVIKPiA+ID4gICBNOiAg
THVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Cj4gPiA+ICAgTDogIGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4KPiA+Cj4gPiBUaGFua3MgQnJlbmRhbi4KPiA+Cj4g
PiBJIGFtIGdvb2Qgd2l0aCB0aGlzLiBJIGNhbiB0YWtlIEtVbml0IHBhdGNoZXMgdGhyb3VnaCBr
c2VsZnRlc3QKPiA+IHdpdGggeW91ciBBY2suCj4KPiBNeSBhY2tub3dsZWRnZW1lbnQ/IFN1cmUh
IEkgdGhvdWdodCB3ZSBhbHJlYWR5IGFncmVlZCB0byB0aGF0Lgo+Cj4gQWxzbywgZG8gd2UgbmVl
ZCBhbiBhY2sgZnJvbSBNYXNhaGlybyBvciBNaWNoYWwgZm9yIHRoZSBLYnVpbGQgcGF0Y2gKPiBb
UEFUQ0ggdjcgMDYvMThdPyBBbmQgYW4gYWNrIGZyb20gSm9zaCBvciBQZXRlciBmb3IgdGhlIG9i
anRvb2wgcGF0Y2gKPiBbUEFUQ0ggdjcgMDgvMThdPwoKQnkgdGhlIHdheSwgSSBhbSBndWVzc2lu
ZyB5b3UgaGF2ZSBhbHJlYWR5IHNlZW4gaXQsIGJ1dCBJIHVwbG9hZGVkIGEKbmV3IHZlcnNpb24g
dG8gaW5jb3Jwb3JhdGUgYSBzdWdnZXN0aW9uIG1hZGUgYnkgTWFzYWhpcm8gb24gcGF0Y2gKMDYv
MTguIEluIGFkZGl0aW9uLCBJIGhhdmUgZ290dGVuIGFja3Mgb24gdGhlIHR3byBwYXRjaGVzIG1l
bnRpb25lZAphYm92ZS4gU28gSSB0aGluayB3ZSBhcmUgZ29vZCB0byBnby4KClRoYW5rcyEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
