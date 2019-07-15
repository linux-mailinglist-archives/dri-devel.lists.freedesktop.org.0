Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D12684B1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 09:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A560E89781;
	Mon, 15 Jul 2019 07:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23DC89781
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 07:58:03 +0000 (UTC)
Received: from [189.27.46.152] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hmvrD-0003qC-8d; Mon, 15 Jul 2019 07:57:11 +0000
Date: Mon, 15 Jul 2019 04:57:02 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH 8/8] docs: remove extra conf.py files
Message-ID: <20190715045702.1e2b569b@coco.lan>
In-Reply-To: <e3ff0a8a-6956-3855-07be-9c126df2da2d@darmarit.de>
References: <cover.1563115732.git.mchehab+samsung@kernel.org>
 <12a160afc9e70156f671010bd4ccff9311acdc5e.1563115732.git.mchehab+samsung@kernel.org>
 <e3ff0a8a-6956-3855-07be-9c126df2da2d@darmarit.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eJlbjim1fxU57ZaVX/VVgKi/dG9GtJerPxx9UJo7Fww=; b=JcDzLwBGAR3DIQ5PzjliPmdfB
 wt3f3sg2z3AO/OuERhsRmMQS2qwxDHfr81HUZ8bO4iiwRmK3RrOm2h4/5DNGgtFEZDvuz7A8dJNNm
 8SC+KQ1Nwm9BOBk47L69bPbiRtcflOhdeLDtFR53AOVtvZ10BSu6RTR+jOSoexCb+TOn62JzVO7/Z
 O55lv0FaRBBJ2LYyXSZdelp0ocAQap0NW6KHdOxn0lTVtf8TDPBJOZV7LLeVVU8RcXQa7O955vRo5
 mleM8mlHWSbuEWzj/LK75trdO7CY3hdfI2sN1X09S7ln7kgJuHQUi7kWjs9YHKWyAOp1nM2lXWTrS
 FqvVaEtvQ==;
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
Cc: alsa-devel@alsa-project.org, Rich Felker <dalias@libc.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Ingo Molnar <mingo@redhat.com>,
 linux-input@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Sean Paul <sean@poorly.run>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, "David
 S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gTW9uLCAxNSBKdWwgMjAxOSAwODoxNjo1NCArMDIwMApNYXJrdXMgSGVpc2VyIDxtYXJrdXMu
aGVpc2VyQGRhcm1hcml0LmRlPiBlc2NyZXZldToKCj4gSGkgTWF1cm8sCj4gCj4gc29ycnksIEkg
aGF2bid0IHRlc3RlZCB5b3VyIHBhdGNoLCBidXQgb25lIHF1ZXN0aW9uIC4uLgo+IAo+IEFtIDE0
LjA3LjE5IHVtIDE3OjEwIHNjaHJpZWIgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiOgo+ID4gTm93IHRo
YXQgdGhlIGxhdGV4X2RvY3VtZW50cyBhcmUgaGFuZGxlZCBhdXRvbWF0aWNhbGx5LCB3ZSBjYW4K
PiA+IHJlbW92ZSB0aG9zZSBleHRyYSBjb25mLnB5IGZpbGVzLiAgCj4gCj4gV2UgbmVlZCB0aGVz
ZSBjb25mLnB5IGFsc28gZm9yIGNvbXBpbGluZyBib29rcycgaW50byBIVE1MLiAgRm9yIHRoaXMK
PiB0aGUgdGFncy5hZGQoInN1YnByb2plY3QiKSBpcyBuZWVkZWQuICBTaG91bGQgd2UgcmVhbHkg
ZHJvcCB0aGlzIGZlYXR1cmU/Cj4gCj4gLS0gTWFya3VzIC0tCgpZb3UncmUgcmlnaHQ6IGFkZGlu
ZyAic3VicHJvamVjdCIgdGFncyBpcyBuZWVkZWQgZm9yIGh0bWwuIEZvbGRpbmcgdGhpcwp0byBw
YXRjaCA3LzggbWFrZXMgYm90aCBodG1sZG9jcyBhbmQgcGRmZG9jcyB0byB3b3JrIHdpdGggU1BI
SU5YRElSUwp3aXRob3V0IHRoZSBuZWVkIG9mIGEgcGVyLXN1YmRpciBjb25mLnB5LgoKUmVnYXJk
cywKTWF1cm8KCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3NwaGlueC9sb2FkX2NvbmZpZy5w
eSBiL0RvY3VtZW50YXRpb24vc3BoaW54L2xvYWRfY29uZmlnLnB5CmluZGV4IDc1ZjUyN2ZmNGM5
NS4uZTRhMDRmMzY3YjQxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3NwaGlueC9sb2FkX2Nv
bmZpZy5weQorKysgYi9Eb2N1bWVudGF0aW9uL3NwaGlueC9sb2FkX2NvbmZpZy5weQpAQCAtNTEs
MyArNTEsNyBAQCBkZWYgbG9hZENvbmZpZyhuYW1lc3BhY2UpOgogICAgICAgICAgICAgZXhlY2Zp
bGVfKGNvbmZpZ19maWxlLCBjb25maWcpCiAgICAgICAgICAgICBkZWwgY29uZmlnWydfX2ZpbGVf
XyddCiAgICAgICAgICAgICBuYW1lc3BhY2UudXBkYXRlKGNvbmZpZykKKyAgICAgICAgZWxzZToK
KyAgICAgICAgICAgIGNvbmZpZyA9IG5hbWVzcGFjZS5jb3B5KCkKKyAgICAgICAgICAgIGNvbmZp
Z1sndGFncyddLmFkZCgic3VicHJvamVjdCIpCisgICAgICAgICAgICBuYW1lc3BhY2UudXBkYXRl
KGNvbmZpZykKClRoYW5rcywKTWF1cm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
