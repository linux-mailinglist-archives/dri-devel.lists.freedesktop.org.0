Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75AB5502F8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 07:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C9C11AB7C;
	Sat, 18 Jun 2022 05:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E080411AB7C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:38:25 +0000 (UTC)
Date: Sat, 18 Jun 2022 05:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1655530703; x=1655789903;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=tSyuifwbDS+nq+djQ6UlupBBlFH3ObNvyWiXS6k/EK1lYGEIxBeaDM7EN/IfpCs2Q
 n/nQgJOkiGJgQYHY4ECCKEzAs6QO44mcxo0XHN3e0IrjFGXfTr0B83F97Pm3yRf+uA
 ACYvdGGWr61XJ13gobn0YOffxqjoQxd1wHzs18t4SudiP15b6PJluRqWsQFQfOg0mk
 D/UG0sUVnhKQkEK5zgT2ixRnbFDvGXvmPC2VyInN+ckNJDWCRQbUc2+fhHafNeP6KO
 S+pdhmDvNuPDsQp81YUWx3XO7JPDpT7yfE+LFYRwg/+sW0ekGz534YeGtWm9s1tbbN
 8LmbCWNu/vitQ==
To: Souptick Joarder <jrdr.linux@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amd/display: Remove unused variable 'abo'
Message-ID: <_2lEhqJcf7dWZ9gxUFTqACIgfM7O6Mnus7HdamgrIT3zwLBiP7Quzy9MLnuFk5EYQAobBEa9UwI-1SSgEhmsncVEsKai10xWlJk8LvRs-W0=@emersion.fr>
In-Reply-To: <20220618015642.5958-1-jrdr.linux@gmail.com>
References: <20220618015642.5958-1-jrdr.linux@gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Kernel test robot <lkp@intel.com>, sunpeng.li@amd.com, shenshih@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
