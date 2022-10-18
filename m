Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF06029A6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 12:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878CE10EB98;
	Tue, 18 Oct 2022 10:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Tue, 18 Oct 2022 10:49:23 UTC
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
 by gabe.freedesktop.org (Postfix) with ESMTP id 352B310EB98;
 Tue, 18 Oct 2022 10:49:23 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 2958692009C; Tue, 18 Oct 2022 12:39:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 231E192009B;
 Tue, 18 Oct 2022 11:39:20 +0100 (BST)
Date: Tue, 18 Oct 2022 11:39:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v6.1-rc1
In-Reply-To: <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
Message-ID: <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
References: <20221017145157.1866351-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: D Scott Phillips <scott@os.amperecomputing.com>, linux-rdma@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kvm-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Oct 2022, Geert Uytterhoeven wrote:

> >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > 2616, 2621
> 
> mips-gcc11/micro32r2_defconfig
> mips-gcc11/micro32r2el_defconfig

 Where can these configs be obtained from?

  Maciej
