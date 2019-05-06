Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA6314774
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 11:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8060889819;
	Mon,  6 May 2019 09:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFFA89819
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 09:18:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g24so10850377otq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 02:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EuMXXHqqPef2GwgL+nQvKY3dmYnxYLGClh5z++gsDCE=;
 b=ZZnUcb46z81R+E+RC8SSnXlVmqC9tKce0Im89Xz7uR6bBjcWvMp0LDURTTgSIB9YbM
 GutRHqGY/ETjFEgHeccPfEDiTo9zb4HErT4RLNSDFYwAwU7cy982g2pV+T1/TaGr1ieV
 FFZhkxEj2t8oPVi3BksiPhShcZLVFqw3sA3/EjLfp7iBUS8tNWCPHlKLWTc5tXHtLHzZ
 D5cFDDtT8a1+hKNv/sEP/ERLM5bQHpV1QppP8+7beV8EzyT1uOc5UGdK1wUfkQmNVhaS
 YfUctJzCv1CwHGaht2UgC759AHRCMvAJQCssaoeL5ncoPkze/+CeSVVfl0i6ceY/xQwl
 E/TA==
X-Gm-Message-State: APjAAAVMSK6aR4bIC2gZirT2yPel+uboT5+SeXnOhRYNS/h064Cqtf1Y
 g+yMFOELo6bwZHVneRKhjuk/HuzJHrntdmXS9kFOHw==
X-Google-Smtp-Source: APXvYqwJ3xWdH/Lcmkx6YRG/BMIY9WxqPyKwUn5ZqoX3PeD8nyMheiZI5T1OFI6UXxsrrwGRwMbiUWxrFpDFumPm0yg=
X-Received: by 2002:a9d:71de:: with SMTP id z30mr15637896otj.113.1557134293178; 
 Mon, 06 May 2019 02:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-16-brendanhiggins@google.com>
 <68f88e1c-d40f-9dad-7296-ab2b2303c575@kernel.org>
In-Reply-To: <68f88e1c-d40f-9dad-7296-ab2b2303c575@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 6 May 2019 02:18:01 -0700
Message-ID: <CAFd5g456XwQV2+iy=0K7AwBc5wbQDRL2DAJgMEsJBLtFdZ5erQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] MAINTAINERS: add entry for KUnit the unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EuMXXHqqPef2GwgL+nQvKY3dmYnxYLGClh5z++gsDCE=;
 b=sqUiKiFkHuS/zMcsXJp/YVQ9Xvsj9z1z6Qymcl2DruVbxk25BEUbeggocvbWAnhm5w
 zafVtoeptdhmkmQVySQB3JwkXQHS6fLm2/wWTVMXU2RAbc2imQQv9+YkBVvD6ic2JuMI
 1ikTcpdlA9VrSJ94GFL5FOP0BgugrA521QHxv3MHfGRZERmqFxPksbw8JgkSiOXb5kCz
 NhICHik7i/u7iBVQPDnR6rVT2h+P/BC3GpK/7XThzUVtCWPANcl0bPo/9Evg9oejZRXN
 F/kwBaILmSEdHFapwIeGtAxrGfQ7g/4sN7rpo+FU+AipihP/fGSchFlx5sCt7F6gjQZJ
 akeQ==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA3OjM4IEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDUvMS8xOSA1OjAxIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBB
ZGQgbXlzZWxmIGFzIG1haW50YWluZXIgb2YgS1VuaXQsIHRoZSBMaW51eCBrZXJuZWwncyB1bml0
IHRlc3RpbmcKPiA+IGZyYW1ld29yay4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICAgTUFJTlRBSU5F
UlMgfCAxMCArKysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4
IDVjMzhmMjFhZWU3ODcuLmM3OGFlOTVjNTZiODAgMTAwNjQ0Cj4gPiAtLS0gYS9NQUlOVEFJTkVS
Uwo+ID4gKysrIGIvTUFJTlRBSU5FUlMKPiA+IEBAIC04NDQ4LDYgKzg0NDgsMTYgQEAgUzogICAg
IE1haW50YWluZWQKPiA+ICAgRjogIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzLwo+ID4gICBGOiAg
RG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3NlbGZ0ZXN0Kgo+ID4KPiA+ICtLRVJORUwgVU5JVCBU
RVNUSU5HIEZSQU1FV09SSyAoS1VuaXQpCj4gPiArTTogICBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5k
YW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiArTDogICBrdW5pdC1kZXZAZ29vZ2xlZ3JvdXBzLmNv
bQo+ID4gK1c6ICAgaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFy
dHkva2VybmVsL2RvY3MvCj4gPiArUzogICBNYWludGFpbmVkCj4gPiArRjogICBEb2N1bWVudGF0
aW9uL2t1bml0Lwo+ID4gK0Y6ICAgaW5jbHVkZS9rdW5pdC8KPiA+ICtGOiAgIGt1bml0Lwo+ID4g
K0Y6ICAgdG9vbHMvdGVzdGluZy9rdW5pdC8KPiA+ICsKPgo+IFBsZWFzZSBhZGQga3NlbGZ0ZXN0
IG1haWxpbmcgbGlzdCB0byB0aGlzIGVudHJ5LCBiYXNlZCBvbiBvdXIKPiBjb252ZXJzYXRpb24g
b24gdGFraW5nIHRoZXNlIHBhdGNoZXMgdGhyb3VnaCBrc2VsZnRlc3QgdHJlZS4KCldpbGwgZG8u
CgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
