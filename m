Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3AB5514FC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E81010E35A;
	Mon, 20 Jun 2022 09:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC5710E8FA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:56:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 266B560A75;
 Mon, 20 Jun 2022 09:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A22C3411B;
 Mon, 20 Jun 2022 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655718978;
 bh=1feoivY7gwwMDCEhN+h7CXS1lJojSZFu+I+k5bzv8lY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bXSZGrRZaf5e2n8tbsdGgJIvPmuI2GM9VQK6GSLMSkonCkVFpjPmfOzhF7bNZJsHe
 ULseOJRdk5rQbsZsEAjaJcz0mHlPE7xstzmqAyqOO+zTWh6XqMn5i8sDZr51KbHOxh
 2W2neMoTs2CkoRr0Zy0wBgbSASRpSf4DjQ1PI6Ts=
Date: Mon, 20 Jun 2022 11:56:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: maciej.kwapulinski@linux.intel.com
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <YrBEP4P9JA60LeOB@kroah.com>
References: <85a6nq45uh.fsf@linux.intel.com>
 <20220620094907.4101274-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620094907.4101274-1-maciej.kwapulinski@linux.intel.com>
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
Cc: arnd@arndb.de, corbet@lwn.net, guy.zadicario@intel.com,
 dragan.cvetic@xilinx.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy.shevchenko@gmail.com, derek.kiernan@xilinx.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 11:49:07AM +0200, maciej.kwapulinski@linux.intel.com wrote:
> Please share your thoughts.

No code here to share thoughts about :(
