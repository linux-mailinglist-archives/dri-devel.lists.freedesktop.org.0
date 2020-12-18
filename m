Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61482DE98C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 20:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FDE89B9F;
	Fri, 18 Dec 2020 19:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5889B9F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 19:06:35 +0000 (UTC)
X-Gm-Message-State: AOAM5315X8fQF8r0Fr4yWnZBuZZm8K4Rb146KOPEo4AZis3gC51tcOpz
 b80Cq38TcTs0CMPTRKRrRe1JVTmlJTukXAuwFFo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608318395;
 bh=XqqUPWojYmVPa7mNvfdt2K6nsdL8qf0Nn64FWqOiRfg=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=K8LTNF5EAIrDyyXbJeLPbpVxfZPtM1t9yg9CmbfDklpEk9fQA+2rcQjBGXyOKXWNs
 KnG6JEoXiT1DkDaBaIix0tcxqVtbnprR9VZDmQypUz/KB98LQIGKbiV5siz0ebror9
 GvUM9JXZLrFckVytdmYbqvoxrhwILRjNreh2HS/00aYqe0Ob1Sl2tlelW36e0KKGq4
 KAoPvNRSyiy3RsWLymEdiyQhg9Lccl03FCLahdSAi3HhVsEdua40DOlrj4suZ1qRv3
 IIrRTkrleDKt9AzW6gUmWryJtTDSgVyEXwxbJp12eePcIaY+orThiOWXygB0Vjml7y
 nQ/jrt8UnY6BA==
X-Google-Smtp-Source: ABdhPJz3HweeVkhoNpDXXFqFCDgm+Kc4nRywUlwowz8nue7LdkTL2NF8tT9eRO6IkY6jUhdwzE1scnHXL/1l4urtg5I=
X-Received: by 2002:a05:6638:83:: with SMTP id
 v3mr5077068jao.106.1608318394559; 
 Fri, 18 Dec 2020 11:06:34 -0800 (PST)
MIME-Version: 1.0
References: <X9LBUn5KIKVKQGlI@eriador.lumag.spb.ru>
In-Reply-To: <X9LBUn5KIKVKQGlI@eriador.lumag.spb.ru>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Dec 2020 14:06:23 -0500
X-Gmail-Original-Message-ID: <CA+5PVA58UnGhdurXuQq8=46yr=OvyMfqhRvjbzjBe7KPfRK_TA@mail.gmail.com>
Message-ID: <CA+5PVA58UnGhdurXuQq8=46yr=OvyMfqhRvjbzjBe7KPfRK_TA@mail.gmail.com>
Subject: Re: linux-firmware: add firmware for Lontium lt9611uxc DSI to HDMI
 bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pulled and pushed out.

josh

On Thu, Dec 10, 2020 at 7:46 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hello linux-firmware maintainers,
>
> The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:
>
>   Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware lt9611uxc
>
> for you to fetch changes up to 63ab3db8399a504048716eb3feed2867da58876a:
>
>   linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge (2020-12-11 03:27:38 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge
>
>  LICENSE.Lontium  |   2 ++
>  WHENCE           |   8 ++++++++
>  lt9611uxc_fw.bin | Bin 0 -> 17932 bytes
>  3 files changed, 10 insertions(+)
>  create mode 100644 LICENSE.Lontium
>  create mode 100644 lt9611uxc_fw.bin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
