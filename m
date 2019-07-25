Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7DD747F5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3916E632;
	Thu, 25 Jul 2019 07:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9E66E632
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:16:39 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8187621734;
 Thu, 25 Jul 2019 07:16:37 +0000 (UTC)
Date: Thu, 25 Jul 2019 09:16:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [RFC] Staging: fbtft: Typo in
Message-ID: <20190725071635.GA17271@kroah.com>
References: <f4881a63-8702-55f2-ed03-cfbc30970083@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4881a63-8702-55f2-ed03-cfbc30970083@wanadoo.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564038998;
 bh=Twe7T2ksbtZDBiQa7kI9kVZPuxOy4gwdvC5nAZG75H4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5Rt+SvwJnjf8AhPSfbDvu5rxBNibDaMh3f0kbsM0xcaYZ0mzb9e8ssJjpsgeuDEW
 LxSwJIRU0oWiVrKh+HQERxJ06yB9JBDtkhAnsWNe7YU4AMFa1GqNv/TWwKHsztpVT6
 ipUOuzZHSDbZOxYjjCWDq3VF+3lhtzG7aOvUARUo=
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
Cc: linux-fbdev@vger.kernel.org,
 Kernel Janitors <kernel-janitors@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, nishadkamdar@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgMDg6NTQ6MzlQTSArMDIwMCwgQ2hyaXN0b3BoZSBKQUlM
TEVUIHdyb3RlOgo+IEhpLAo+IAo+IGxvb2tpbmcgYXQgdGhlIGNvZGUgaW4gJ2RyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYl9wY2Q4NTQ0LmMnLCB0aGVyZSBzZWVtcyB0bwo+IGJlIHNvbWUgdHlwb3Mu
Cj4gCj4gQXQgdGhlIGVuZCBvZiB0aGUgZmlsZSwgd2UgY2FuIGZpbmQ6Cj4gCj4gRkJURlRfUkVH
SVNURVJfRFJJVkVSKERSVk5BTUUsICJwaGlsaXBzLHBkYzg1NDQiLCAmZGlzcGxheSk7Cj4gLi4u
Cj4gTU9EVUxFX0FMSUFTKCJzcGk6cGRjODU0NCIpOwo+IAo+IAo+IEl0IGlzIGxpa2VseSB0aGF0
IHRoZSAyIHBkYzg1NDQgc2hvdWxkIGJlIHBjZDg1NDQuIChkIGFuZCBjIHN3aXRjaGVkKQo+IAo+
IEFzIEkgZG9uJ3Qga25vdyB0aGUgaW1wbGljYXRpb24gb2Ygc3VjaCBhIGNoYW5nZSwgSSBwcmVm
ZXIgdG8gZmlyc3QgcmVwb3J0Cj4gdGhlIHBvdGVudGlhbCBpc3N1ZSwgYmVmb3JlIHByb3Bvc2lu
ZyBhIHBhdGNoIGZvciBpdC4KClN1Ym1pdCBhIHBhdGNoLCB0aGF0J3MgdGhlIGJlc3Qgd2F5IHRv
IGRpc2N1c3MgaXQhCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
